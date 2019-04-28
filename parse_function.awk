


{
    print $0
    if($0 ~ /\s*(\w*)\s+(\w*)\s*\((\s*((\w+)\s+(\w+))?,?)*\);$/)#if this line is a function signature
    {
        ret = gensub(/\s*(\w*)\s+(\w*)\s*\((\s*((\w+)\s+(\w+))?,?)*\);$/, "\\1", "g", $0);
        function_name = gensub(/\s*(\w*)\s+(\w*)\s*\((\s*((\w+)\s+(\w+))?,?)*\);$/, "\\2", "g", $0);
        allparameters = gensub(/\s*(\w*)\s+(\w*)\s*\((.*)\);$/, "\\3", "g", $0);


        print ret
        print function_name
        argc = split(allparameters, parameter, ",")

        for(i=1; i<=argc; i++){
            print "parameter[i]"
            print parameter[i]
            print ""
            argc = split(parameter[i], pair)
            print pair[1];
            print pair[2];
        }
        print ""

    }
}
