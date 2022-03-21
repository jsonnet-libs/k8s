{
  ibmcloud+:: {
    v1alpha1+: {
      // Fieldrefs
      composableGetValueFrom+: {
        new(kind, name, path):
          { getValueFrom: {} }
          + self.withKind(kind)
          + self.withName(name)
          + self.withPath(path),

        // Motifiers
        withKind(kind): { getValueFrom+: { kind: kind } },
        withName(name): { getValueFrom+: { name: name } },
        withNamespace(namespace): { getValueFrom+: { namespace: namespace } },
        withApiVersion(apiversion): { getValueFrom+: { apiVersion: apiversion } },
        withLabels(labels): { getValueFrom+: { labels: labels } },
        withLabelsMixin(labels): { getValueFrom+: { labels+: labels } },
        withPath(path): { getValueFrom+: { path: path } },
        withFormatTransformers(transformers): { getValueFrom+: { formatTransformers: transformers } },
        withFormatTransformersMixin(transformers): { getValueFrom+: { formatTransformers+: transformers } },
      },

      // Transformers
      composableTransformer+: {
        toString(): 'ToString',
        arrayToCommaSeparatedString(): 'ArrayToCSString',
        base64ToString(): 'Base64ToString',
        stringToBase64(): 'StringToBase64',
        stringToInt(): 'StringToInt',
        stringToFloat(): 'StringToFloat',
        stringToBool(): 'StringToBool',
        jsonToObject(): 'JsonToOject',
        objectToJson(): 'ObjectToJson',
      },
    },
  },
}
