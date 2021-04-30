

import List "mo:base/List";
import AssocList "mo:base/AssocList";

actor class User () {
    let username = Text;
    let password = Text;

    flexible var users: AssocList<Text, Text> = List.nil<(username, password)>();
}


actor class UserManager () {

    flexible var userMap
    
    public func checkPassword(username:Text, password:Text): Bool {
        
    }
}