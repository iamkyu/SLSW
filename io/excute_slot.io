// 슬롯 이름이 주어졌을 때, 그 이름에 해당하는 슬롯을 실행하는 프로그램
// e.g. $ io excute_slot.io ride walk
Vehicle := Object clone
Vehicle description := "It is vehicle"
Vehicle ride := method("Ride on Vehicle!" println)

System args foreach(k, v, 
    if(Vehicle getSlot(v)) then(Vehicle perform(v)) else(write("'", v, "' slot is nil\n"))
)
