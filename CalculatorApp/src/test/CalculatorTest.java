
import static org.junit.Assert.*;
import org.junit.Test;

public class CalculatorTest {
    Calculator calc = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(8, calc.add(5, 3));
    }

    @Test
    public void testSubtract() {
        assertEquals(2, calc.subtract(5, 3));
    }
}
