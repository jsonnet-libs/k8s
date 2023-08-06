local d = import 'doc-util/main.libsonnet';

local patch = {
  secretProviderClass+: {
    local secrets_store_csi_driver = self,
    spec+: {
      parameters+: {
        '#newAzureParameters':: d.fn(
          help=' shortcut to define new azure specific prameters with defaults',
          args=[
            d.arg('tenantId', d.T.string),
            d.arg('keyvaultName', d.T.string),
            d.arg('userAssignedIdentityId', d.T.string),
            d.arg('useVMManagedIdentity', d.T.bool, 'true'),
            d.arg('usePodIdentity', d.T.bool, 'false'),
          ]
        ),
        newAzureParameters(
          tenantId,
          keyvaultName,
          userAssignedIdentityId,
          useVMManagedIdentity=true,
          usePodIdentity=false
        ):: {
              cloudName: '',
              objects: '',
            }
            + self.withTenantId(tenantId)
            + self.withKeyvaultName(keyvaultName)
            + self.withUserAssignedIdentityId(userAssignedIdentityId)
            + self.withUseVMManagedIdentity(useVMManagedIdentity)
            + self.withUsePodIdentity(usePodIdentity),

        '#withUsePodIdentity':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('usePodIdentity', d.T.bool)]),
        withUsePodIdentity(usePodIdentity):: { usePodIdentity: std.toString(usePodIdentity) },
        '#withUseVMManagedIdentity':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withUseVMManagedIdentity', d.T.bool)]),
        withUseVMManagedIdentity(useVMManagedIdentity):: { useVMManagedIdentity: std.toString(useVMManagedIdentity) },
        '#withUserAssignedIdentityId':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withUserAssignedIdentityId', d.T.string)]),
        withUserAssignedIdentityId(userAssignedIdentityID):: { userAssignedIdentityID: userAssignedIdentityID },
        '#withKeyvaultName':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withKeyvaultName', d.T.string)]),
        withKeyvaultName(keyvaultName):: { keyvaultName: keyvaultName },
        '#withCloudName':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withCloudName', d.T.string)]),
        withCloudName(cloudName):: { cloudName: cloudName },
        '#withTenantId':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withTenantId', d.T.string)]),
        withTenantId(tenantId):: { tenantId: tenantId },
        '#withClientId':: d.fn(help='Helper-function to set attribute according to to specification (https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access#use-a-user-assigned-managed-identity)', args=[d.arg('withClientId', d.T.string)]),
        withClientId(clientId):: { clientID: clientId },

        '#withObjects':: d.fn(help='Function to render objects-text. Takes an object-array e.g. [{objectName:"name",objectType:"secret"}] or an single object.', args=[d.arg('objects', d.T.array)]),
        withObjects(objects):: {
          objects: std.manifestYamlDoc({
            local f = function(x) std.join('', std.map(function(y) |||
              %s: '%s'
            ||| % [y, x[y]], std.objectFields(x))),
            array: std.map(
              f,
              if std.isArray(objects) then objects else [objects]
            ),
          }, indent_array_in_object=true, quote_keys=false),
        },
      },
      secretObjects+: {
        data+: {
          '#new':: d.fn(
            help='Create new secretsObjects data entry. Object has to have an objectName field or should be provided as objectName string',
            args=[
              d.arg('key', d.T.string),
              d.arg('object', d.T.object),
            ]
          ),
          new(key, object)::
            local objectName = if std.isObject(object) then object.objectName else object;
            {}
            + secrets_store_csi_driver.spec.secretObjects.data.withKey(key)
            + secrets_store_csi_driver.spec.secretObjects.data.withObjectName(objectName),
        },
        '#new':: d.fn(
          help='Create new secretsObject.',
          args=[
            d.arg('name', d.T.string),
            d.arg('objects', d.T.array),
          ]
        ),
        new(name, objects, type='Opaque')::
          {}
          + secrets_store_csi_driver.spec.secretObjects.withSecretName(name)
          + secrets_store_csi_driver.spec.secretObjects.withType(type)
          + secrets_store_csi_driver.spec.secretObjects.withData(
            [secrets_store_csi_driver.spec.secretObjects.data.new(x, objects[x]) for x in std.objectFields(objects)]
          ),
      },
    },
    '#new':: d.fn(
      help='Create new azure specific secretProviderClass.',
      args=[
        d.arg('name', d.T.string),
        d.arg('tenantId', d.T.string),
        d.arg('keyvaultName', d.T.string),
        d.arg('userAssignedIdentityId', d.T.string),
        d.arg('objects', d.T.array, '[]'),
        d.arg('secretName', d.T.array, 'null'),
        d.arg('secretObjects', d.T.array, '[]'),
      ]
    ),
    newAzure(
      name,
      tenantId,
      keyvaultName,
      userAssignedIdentityId,
      objects=[],
      secretName=null,
      secretObjects=[]
    ):: self.new(name)
        + self.spec.withProvider('azure')
        + {
          spec+: {
            parameters+: secrets_store_csi_driver.spec.parameters.newAzureParameters(
              userAssignedIdentityId=userAssignedIdentityId,
              keyvaultName=keyvaultName,
              tenantId=tenantId
            ) + secrets_store_csi_driver.spec.parameters.withObjects(objects),
          },
        }
        + if secretName != null then self.spec.withSecretObjects([
          secrets_store_csi_driver.spec.secretObjects.new(secretName, objects),
        ]) else {}
                + self.spec.withSecretObjects(secretObjects),
  },
};

{
  nogroup+: {
    v1+: patch,
    v1alpha1+: patch,
  },
}
