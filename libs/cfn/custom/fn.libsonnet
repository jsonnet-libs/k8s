  local d = (import 'doc-util/main.libsonnet');
{
    fn+:: {
        '#':: d.pkg(name='fn', url='', help='https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html'),
        '#base64':: d.fn(help='The intrinsic function Fn::Base64 returns the Base64 representation of the input string. This function is typically used to pass encoded data to Amazon EC2 instances by way of the UserData property.\nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html', args=[d.arg(name='valueToEncode', type=d.T.string)]),
        base64(valueToEncode):: 
            { "Fn::Base64" : valueToEncode },
        '#cidr':: d.fn(help='The intrinsic function Fn::Cidr returns an array of CIDR address blocks. The number of CIDR blocks returned is dependent on the count parameter. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html', args=[d.arg(name='ipBlock', type=d.T.string),d.arg(name='count', type=d.T.string),d.arg(name='cidrBits', type=d.T.string)]),
        cidr(ipBlock, count, cidrBits):: 
            { "Fn::Cidr" : [ipBlock, count, cidrBits]},
        '#findInMap':: d.fn(help='The intrinsic function Fn::FindInMap returns the value corresponding to keys in a two-level map that\'s declared in the Mappings section. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html', args=[d.arg(name='mapName', type=d.T.string),d.arg(name='topLevelKey', type=d.T.string),d.arg(name='secondLevelKey', type=d.T.string)]),
        findInMap(mapName,topLevelKey,secondLevelKey):: 
            { "Fn::FindInMap" : [ mapName, topLevelKey, secondLevelKey] },
        '#getAtt':: d.fn(help='The Fn::GetAtt intrinsic function returns the value of an attribute from a resource in the template. For more information about GetAtt return values for a particular resource, refer to the documentation for that resource in the Resource and property reference. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html', args=[d.arg(name='logicalNameOfResource', type=d.T.string),d.arg(name='attributeName', type=d.T.string)]),
        getAtt(logicalNameOfResource,attributeName):: 
            { "Fn::GetAtt" : [ logicalNameOfResource, attributeName ] },
        '#getAZs':: d.fn(help='The intrinsic function Fn::GetAZs returns an array that lists Availability Zones for a specified region in alphabetical order. Because customers have access to different Availability Zones, the intrinsic function Fn::GetAZs enables template authors to write templates that adapt to the calling user\'s access. That way you don\'t have to hard-code a full list of Availability Zones for a specified region. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html', args=[d.arg(name='region', type=d.T.string)]),
        getAZs(region):: 
            { "Fn::GetAZs" : region },
        '#importValue':: d.fn(help='The intrinsic function Fn::ImportValue returns the value of an output exported by another stack. You typically use this function to create cross-stack references. In the following example template snippets, Stack A exports VPC security group values and Stack B imports them. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html', args=[d.arg(name='sharedValueToImport', type=d.T.string)]),
        importValue(sharedValueToImport):: 
            { "Fn::ImportValue" : sharedValueToImport },
        '#join':: d.fn(help='The intrinsic function Fn::Join appends a set of values into a single value, separated by the specified delimiter. If a delimiter is the empty string, the set of values are concatenated with no delimiter. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html', args=[d.arg(name='delimiter', type=d.T.string),d.arg(name='listOfValues', type=d.T.array)]),
        join(delimiter,listOfValues=[]):: 
            { "Fn::Join" : [ delimiter, listOfValues ] },
        '#select':: d.fn(help='The intrinsic function Fn::Select returns a single object from a list of objects by index. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html', args=[d.arg(name='index', type=d.T.number),d.arg(name='valueToEncode', type=d.T.array)]),
        select(index, listOfObjects=[]):: 
            { "Fn::Select" : [ index, listOfObjects ] },
        '#split':: d.fn(help='To split a string into a list of string values so that you can select an element from the resulting string list, use the Fn::Split intrinsic function. Specify the location of splits with a delimiter, such as , (a comma). After you split a string, use the Fn::Select function to pick a specific element. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html', args=[d.arg(name='delimiter', type=d.T.string),d.arg(name='source', type=d.T.string)]),
        split(delimiter, source):: 
            { "Fn::Split" : [ delimiter, source ] },
        '#sub':: d.fn(help='The intrinsic function Fn::Sub substitutes variables in an input string with values that you specify. In your templates, you can use this function to construct commands or outputs that include values that aren\'t available until you create or update a stack. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html', args=[d.arg(name='source', type=d.T.string),d.arg(name='mapOfSubs', type=d.T.object)]),
        sub(source, mapOfSubs={}):: 
            { "Fn::Sub" : [ source, mapOfSubs ] },
        '#transform':: d.fn(help='The intrinsic function Fn::Transform specifies a macro to perform custom processing on part of a stack template. Macros enable you to perform custom processing on templates, from simple actions like find-and-replace operations to extensive transformations of entire templates. For more information, see Using AWS CloudFormation macros to perform custom processing on templates. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-transform.html', args=[d.arg(name='name', type=d.T.string),d.arg(name='parameters', type=d.T.object)]),
        transform(name, parameters={}):: 
            { "Fn::Transform": {"Name": name, "Parameters":parameters,}, },
        '#and':: d.fn(help='Returns true if all the specified conditions evaluate to true, or returns false if any one of the conditions evaluates to false. Fn::And acts as an AND operator. The minimum number of conditions that you can include is 2, and the maximum is 10. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and', args=[d.arg(name='conditions', type=d.T.array)]),
        and(conditions=[])::
            {"Fn::And": conditions},
        '#equals':: d.fn(help='Compares if two values are equal. Returns true if the two values are equal or false if they aren\'t. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals', args=[d.arg(name='conditions', type=d.T.array)]),
        equals(conditions=[])::
            {"Fn::Equals": conditions},
        '#if':: d.fn(help='Returns one value if the specified condition evaluates to true and another value if the specified condition evaluates to false. Currently, CloudFormation supports the Fn::If intrinsic function in the metadata attribute, update policy attribute, and property values in the Resources section and Outputs sections of a template. You can use the AWS::NoValue pseudo parameter as a return value to remove the corresponding property. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if', args=[d.arg(name='condition', type=d.T.string),d.arg(name='valueIfTrue', type=d.T.any),d.arg(name='valueIfFalse', type=d.T.any)]),
        "if"(condition,valueIfTrue,valueIfFalse)::
            {"Fn::If": [condition,valueIfTrue,valueIfFalse]},
        '#not':: d.fn(help='Returns true for a condition that evaluates to false or returns false for a condition that evaluates to true. Fn::Not acts as a NOT operator. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-not', args=[d.arg(name='conditions', type=d.T.array)]),
        not(condition)::
            {"Fn::Not": [condition]},
        '#or':: d.fn(help='Returns true if any one of the specified conditions evaluate to true, or returns false if all the conditions evaluates to false. Fn::Or acts as an OR operator. The minimum number of conditions that you can include is 2, and the maximum is 10. https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-or', args=[d.arg(name='conditions', type=d.T.array)]),
        or(conditions=[d.arg(name='conditions', type=d.T.array)])::
            {"Fn::Or": conditions},
        
    },
    '#ref':: d.fn(help='The intrinsic function Ref returns the value of the specified parameter or resource. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html', args=[d.arg(name='logicalName', type=d.T.string)]),
    ref(logicalName):: { "Ref": logicalName },
    '#condition':: d.fn(help='The intrinsic function Condition returns the evaluated result of the specified condition. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-condition.html', args=[d.arg(name='conditionName', type=d.T.string)]),
    condition(conditionName):: { "Condition": conditionName },
    '#tag':: d.fn(help='You can use the Resource Tags property to apply tags to resources, which can help you identify and categorize those resources. You can tag only resources for which AWS CloudFormation supports tagging. For information about which resources you can tag with CloudFormation, see the individual resources in AWS resource and property types reference. \nhttps://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html', args=[d.arg(name='key', type=d.T.string),d.arg(name='value', type=d.T.string)]),
    tag(key, value):: {"Key": key, "Value": value},
}