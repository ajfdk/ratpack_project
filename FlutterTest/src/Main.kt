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

fun cloner(tobeCloned: BasePet) {
    var clone = tobeCloned.copy()
}