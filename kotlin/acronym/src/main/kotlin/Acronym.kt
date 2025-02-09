object Acronym {
    private val delimiter = Regex("[\\s-_]+")
    fun generate(phrase: String): String {
        return phrase.split(delimiter).joinToString("") { it.first().toString().uppercase() }
    }
}
