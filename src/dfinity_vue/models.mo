import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Hash "mo:base/Hash";
import Types "./types";

module {


  public type User = {
      username: Text;
      age: Nat;
  };

  public class UserManage() {
    // The "database" is just a local hash map
    let usersMap = HashMap.HashMap<Text, User>(1, isEq, Text.hash);

    public func add(user: User): ?User{
        var u = usersMap.get(user.username);
        if (u != null ) {
            var msg = "User '" # user.username # "' already exist";
            Debug.print(msg);
        };
        usersMap.put(user.username, user);
        return u
    };

    public func delByUsername(username: Text) {
        var r = usersMap.remove(username);
        if (r == null) {
            var msg = "User " # username # "don't exist";
            Debug.print(msg);
        };
    };

    public func update(user:User): ?User{
        var r = usersMap.replace(user.username, user);
        if (r == null) {
            var msg = "User " # user.username # "don't exist";
            Debug.print(msg);
        };
        return r;
    };

    public func get(username: Text) : ?User {
        return usersMap.get(username);
    };

    public func getList(page:Nat, pageSize:Nat): [User] {
        Debug.print("in models module list");
        var userList: [User] = [];
        for ((username, user) in usersMap.entries()) {
            userList := Array.append(userList, [user]);
        };
        return userList;
    };

  };

  


  func isEq(x: Text, y: Text): Bool { x == y };
//   var um:UserManage = UserManage();
    // var u = User {
    //     username = "zhangsan";
    //     age = 23;
    // };
    // um.add(u);
};



