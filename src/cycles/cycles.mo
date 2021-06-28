
import Cycles "mo:base/ExperimentalCycles";
import Principal "mo:base/Pricipal";

actor Test {

  public func balance() : async (amount : Nat) {
    return Cycles.balance();
  };

  public func available() : async (amount : Nat) {
    return Cycles.available();

  };

  public func accept(amount : Nat) : async (accepted : Nat) {
    return Cycles.accept(amount);
  };

  public func add(amount : Nat) : async () {
    Cycles.add(amount);
  };

  public func refunded() : async (amount : Nat) {
    return Cycles.refunded();
  };

  public func refunded() : async (amount : Nat) {
    return Cycles.refunded();
  };
}

// let t = await Test();
