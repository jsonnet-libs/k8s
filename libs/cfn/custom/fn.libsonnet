local d = import 'doc-util/main.libsonnet';

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html
/**
    Those features are performed by CloudFormation processor ; of course Jsonnet has its own way to join or base64 encode, but those functions can be used in template in later stage.
 */
{
    fn+:: {
        base64(valueToEncode):: 
            { "Fn::Base64" : valueToEncode },
        cidr(ipBlock, count, cidrBits):: 
            { "Fn::Cidr" : [ipBlock, count, cidrBits]},
        findInMap(mapName,topLevelKey,secondLevelKey):: 
            { "Fn::FindInMap" : [ mapName, topLevelKey, secondLevelKey] },
        getAtt(logicalNameOfResource,attributeName):: 
            { "Fn::GetAtt" : [ logicalNameOfResource, attributeName ] },
        getAZs(region):: 
            { "Fn::GetAZs" : region },
        importValue(sharedValueToImport):: 
            { "Fn::ImportValue" : sharedValueToImport },
        join(delimiter,listOfValues=[]):: 
            { "Fn::Join" : [ delimiter, listOfValues ] },
        select(index, listOfObjects=[]):: 
            { "Fn::Select" : [ index, listOfObjects ] },
        split(delimiter, source):: 
            { "Fn::Split" : [ delimiter, source ] },
        sub(source, mapOfSubs={}):: 
            { "Fn::Sub" : [ source, mapOfSubs ] },
        transform(name, parameters={}):: 
            { "Fn::Transform": {"Name": name, "Parameters":parameters,}, },
        and(conditions=[])::
            {"Fn::And": conditions},
        equals(conditions=[])::
            {"Fn::Equals": conditions},
        "if"(condition,valueIfTrue,valueIfFalse)::
            {"Fn::If": [condition,valueIfTrue,valueIfFalse]},
        not(condition)::
            {"Fn::Not": [condition]},
        or(conditions=[])::
            {"Fn::Or": conditions},
        
    },
    ref(logicalName):: { "Ref": logicalName },
    condition(conditionName):: { "Condition": conditionName },
    tag(key, value):: {"Key": key, "Value": value},
}