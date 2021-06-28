

actor Counter {
    stable var count = 0;
    var aa = 23;

    public func setCount(value : Nat) : async Nat {
        count := value;
        return count;
    };

    public func getCount() : async Nat {
        return count;
    };
}