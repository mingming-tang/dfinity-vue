
import Models "./models";
import Debug "mo:base/Debug";




// um.delByUsername("zhangsan");
// um.delByUsername("lisi");

// um.update(uu);

// var user = um.get("zhangsan");


// var l = [11, 12, 13, 14];




actor {
    var um = Models.UserManage();
    type User = Models.User;


    var u = {
        username = "zhangsan";
        age = 23;
    };
    var r = um.add(u);
    // u.age := 43;


    var uu = {
        username = "zhangsan";
        age = 25;
    };
    public func getUserList(page: Nat, pageSize: Nat) : async [User] {
        return um.getList(1, 23);
    };

    public func addUser(user:User): async ?User {
        return um.add(user);
    };

    public func updateUser(user:User): async ?User {
        return um.update(user);
    };

    public func delByUsername(username: Text) {
        um.delByUsername(username);
    };

}

