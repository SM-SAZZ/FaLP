import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class BaseFuncsKtTest {

    @Test
    fun max3() {
        val main = BaseFuncs()
        val expected = 10
        assertEquals(expected, main.max3(3,10,5))
    }

    @Test
    fun factup() {
        val main = BaseFuncs()
        val expected = 120
        assertEquals(expected, main.factup(5))
    }

    @Test
    fun factdown() {
        val main = BaseFuncs()
        val expected = 720
        assertEquals(expected, main.factdown(6))
    }

    @Test
    fun calc() {
        val main = BaseFuncs()
        val expected = 10
        assertEquals(expected, main.calc(true)(1234))
    }

    @Test
    fun sumd() {
        val main = BaseFuncs()
        val expected = 15
        assertEquals(expected, main.sumd(12345))
    }

    @Test
    fun muld() {
        val main = BaseFuncs()
        val expected = 126
        assertEquals(expected, main.muld(367))
    }

    @Test
    fun maxd() {
        val main = BaseFuncs()
        val expected = 7
        assertEquals(expected, main.maxd(123745))
    }

    @Test
    fun mind() {
        val main = BaseFuncs()
        val expected = 2
        assertEquals(expected, main.mind(923745))
    }
}