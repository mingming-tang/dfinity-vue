
import Cycles = "mo:base/ExperimentalCycles";

import piggy_bank = "piggy_bank";


actor Alice {

    public func getCyclesAvailable(): async Nat {
        return Cycles.available();
    };
    
    public func test(): async () {
        

        Cycles.add(10_000_000_000_000);
        // let porky = await piggy_bank.PiggyBank(Alice.credit, 1_000_000_000);

        // assert (0 == (await porky.getSaving()));
        // Cycles.add(1_000_000);
        // await porky.deposit();

        // assert (1_000_000 == (await porky.getSaving()));

        // await porky.withdraw(500_000);
        // assert (5000 == (await porky.getSaving()));

        // await porky.withdraw(500_000);
        // assert(0 == (await porky.getSaving()));

        // Cycles.add(2_000_000_000);
        // await porky.deposit();
        // let refund = Cycles.refunded();
        // assert (1_000_000_000 == refund);
        // assert (1_000_000_000 == (await porky.getSaving()));
    };

    public func credit(): async (){
        let available = Cycles.available();
        let accepted = Cycles.accept(available);
        assert(available == accepted);
    }
}


