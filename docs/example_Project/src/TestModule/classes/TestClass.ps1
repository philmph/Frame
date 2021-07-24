class TestClass
{
    [string]$String

    TestClass () {}

    TestClass ([string]$String) {
        $this.String = $String
    }
}