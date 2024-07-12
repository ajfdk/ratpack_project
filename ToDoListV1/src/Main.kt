import android.os.CountDownTimer
import java.sql.Time
import java.time.LocalDateTime

fun main() {
    println("This is a test for the ToDoList Backend functionality")
    var taskList = mutableListOf(
        ListObject("Check", Goal.INCOMPLETE, LocalDateTime.of(2024, 7, 11, 18, 0)),
        ListObject("Check-2", Goal.INCOMPLETE,LocalDateTime.of(2024, 6, 11, 18, 0)),
        ListObject("Check-3", Goal.INCOMPLETE, LocalDateTime.of(2025, 7, 11, 18, 0)))
    var listSize = taskList.size
    var currentTime = LocalDateTime.now()
}

fun checkTime(taskList: MutableList<ListObject>, currentTime: LocalDateTime) {
    for (item in taskList) {
        if (item.timeGiven < currentTime) {
            item.taskStatus = Goal.FAIL
        }
        else {
            println("There's Still Time!")
        }
    }
}

enum class Goal() {
    INCOMPLETE,
    DONE,
    FAIL
}

fun listAdd(taskList: MutableList<ListObject>, taskName: String, taskTime: LocalDateTime, listSize: Int) {
    taskList.add(listSize, ListObject(taskName, Goal.INCOMPLETE, taskTime))
}

fun listRemove(taskList: MutableList<ListObject>, removePos: Int) {
    taskList.removeAt(removePos)
}

fun taskDone(taskList: MutableList<ListObject>, taskPos: Int) {
    taskList[taskPos].taskStatus = Goal.DONE
}

data class ListObject(var task : String,
                      var taskStatus : Goal,
                      var timeGiven: LocalDateTime)


