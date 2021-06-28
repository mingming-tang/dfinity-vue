
import Cycles "mo:base/ExperimentalCycles";


shared(msg) actor class FirstCycles (capacity: Nat) {
    var balance = 0;

    public func getBalance(): async Nat {
        return balance;
    };

    public func setBalance(value: Nat): async Nat {
        balance := value;
        return balance;
    };

    public shared(msg) func getCurrentOwner(): async Principal {
        return msg.caller;
    };

    public shared(msg) func getCyclesAvailable(): async Nat {
        return Cycles.available();
    };

    public shared(msg) func getCyclesBalance(): async Nat {
        return Cycles.balance();
    };


    /// Returns the currently available `amount` of cycles.
    /// The amount available is the amount received in the current call,
    /// minus the cumulative amount `accept`ed by this call.
    /// On exit from the current shared function or async expression via `return` or `throw`
    /// any remaining available amount is automatically
    /// refunded to the caller/context.
    public func available() : async Nat {
        return Cycles.available();
    };

    /// Transfers up to `amount` from `available()` to `balance()`.
    /// Returns the amount actually transferred, which may be less than
    /// requested, for example, if less is available, or if canister balance limits are reached.
    public func accept(amount : Nat) : async Nat {
        return Cycles.accept(amount);
    };

    /// Indicates additional `amount` of cycles to be transferred in
    /// the next call, that is, evaluation of a shared function call or
    /// async expression.
    /// Upon the call, but not before, the total amount of cycles ``add``ed since
    /// the last call is deducted from `balance()`.
    /// If this total exceeds `balance()`, the caller traps, aborting the call.
    ///
    /// **Note**: the implicit register of added amounts is reset to zero on entry to
    /// a shared function and after each shared function call or resume from an await.
    public func add(amount : Nat) {
        Cycles.add(amount);
    };

    /// Reports `amount` of cycles refunded in the last `await` of the current
    /// context, or zero if no await has occurred yet.
    /// Calling `refunded()` is solely informational and does not affect `balance()`.
    /// Instead, refunds are automatically added to the current balance,
    /// whether or not `refunded` is used to observe them.
    public func refunded() : async Nat {
        return Cycles.refunded();
    };
  };

