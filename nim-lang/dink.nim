import re

let dink = re"hallo"


echo """hhallo jij!""".find(dink)


proc isHcl(passport: string): bool =
    var output = passport.find(re"^#(?:[0-9a-fA-F]{3}){1,2}$")
    return output != -1

echo isHcl("#ceb3a1")
echo isHcl("#FFF")
echo isHcl("#abcdef")
echo isHcl("##ceb3a1")
