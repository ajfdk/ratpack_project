//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
fun main() {
    val name = "Kotlin"
    //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
    // to see how Android Studio suggests fixing it.
    println("Hello, " + name + "!")

    for (i in 1..5) {
        //TIP Press <shortcut actionId="Debug"/> to start debugging your code. We have set one <icon src="AllIcons.Debugger.Db_set_breakpoint"/> breakpoint
        // for you, but you can always add more by pressing <shortcut actionId="ToggleLineBreakpoint"/>.
        println("i = $i")
    }

    print(6/5)
}

enum class Status() {
    GREAT,
    HAPPY,
    OK,
    TIRED,
    SICK
}

class BasePet() {
    var hunger = 0
    var happiness = 0
    var growth = 0
    var age = 0
    var name = "basePet"
    var state = Status.OK
}

fun BasePet.clone(): BasePet {
    val pet = BasePet()
    pet.hunger = hunger
    pet.happiness = happiness
    pet.growth = growth
    pet.age = age
    pet.name = name
    pet.state = state
    return pet
}

fun todo() {

}