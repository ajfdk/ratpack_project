//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
fun main() {
    var pet = BasePet(0, 0, 0, 0, "BasePet", Status.OK)
    var clone = pet.copy()
    clone.hunger = 100

    println(pet.hunger)
    println(clone.hunger)
    clone.state = Status.SICK

    println(pet.state)
    println(clone.state)
}

enum class Status() {
    GREAT,
    HAPPY,
    OK,
    TIRED,
    SICK
}

data class BasePet(var hunger: Int,
                   var happiness: Int,
                   var growth: Int,
                   var age: Int,
                   var name: String,
                   var state : Status)

/*fun BasePet.clone(): BasePet {
    val pet = BasePet()
    pet.hunger = hunger
    pet.happiness = happiness
    pet.growth = growth
    pet.age = age
    pet.name = name
    pet.state = state
    return pet
}*/

fun todo() {

}