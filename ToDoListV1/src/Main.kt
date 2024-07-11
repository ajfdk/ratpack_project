import android.os.CountDownTimer
import java.sql.Time

fun main() {
    println("This is a test for the ToDoList Backend functionality")
    var taskList = mutableListOf(
        ListObject("Check", Goal.INCOMPLETE, 30000),
        ListObject("Check-2", Goal.FAIL,0),
        ListObject("Check-3", Goal.DONE, 18483))
    var listSize = taskList.size
    println(taskList)
    listAdd(taskList, "Check-4", 1000000, listSize)
    println(taskList)
    listRemove(taskList, 2)
    println(taskList)
}

enum class Goal() {
    INCOMPLETE,
    DONE,
    FAIL
}

fun listAdd(taskList: MutableList<ListObject>, taskName: String, taskTime: Long, listSize: Int) {
    taskList.add(listSize, ListObject(taskName, Goal.INCOMPLETE, taskTime))
}

fun listRemove(taskList: MutableList<ListObject>, removePos: Int) {
    taskList.removeAt(removePos)
}

data class ListObject(var task : String,
                      var taskStatus : Goal,
                      var timeGiven: Long)


