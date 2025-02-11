import kotlin.math.pow

object ArmstrongNumber {

    fun check(input: Int): Boolean {
        val digits = input.digits()
        return digits.sumOf { it.pow(digits.size) } === input
    }

    private fun Int.digits(): List<Int> = toString().map(Char::digitToInt)
    private fun Int.pow(n: Int): Int = toFloat().pow(n).toInt()
}
