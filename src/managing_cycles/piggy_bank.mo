
import Cycles "mo:base/ExperimentalCycles";


shared(msg) actor class PiggyBank(
    benifit: shared() -> async(),
    capacity: Nat
){
    var saving = 0;
    var owner = msg.caller;

    public func getSaving(): async Nat {
        return saving;
    };

    public shared(msg) func deposit() : async () {
        var amount = Cycles.available();
        var limit = capacity - saving;
        var acceptable = if (amount <= limit) amount else limit;
        var accepted = Cycles.accept(acceptable);
        assert (accepted == acceptable);
        saving += acceptable;
    };

    public shared(msg) func withdraw(amount: Nat): async(){
        assert (amount <= saving);
        Cycles.add(amount);
        await benifit();
        let refund = Cycles.refunded();
        saving -= amount - refund;
    }
}