mod Test.Exp.Jvm.InvokeConstructor {

    import java.lang.Boolean
    import java.lang.Byte
    import java.lang.Character
    import java.lang.Double
    import java.lang.Float
    import java.lang.Integer
    import java.lang.Long
    import java.lang.Object
    import java.lang.Short
    import java.lang.{String => JString}
    import java.net.URLClassLoader
    import java.net.URL
    import java.util.{Locale$Builder => Builder}

    @test
    def testInvokeConstructor01(): Boolean =
        new Boolean(true)

    @test
    def testInvokeConstructor02(): Character =
        new Character('a')

    @test
    def testInvokeConstructor03(): Float =
        new Float(123.456f32)

    @test
    def testInvokeConstructor04(): Double =
        new Double(123.456f64)

    @test
    def testInvokeConstructor05(): Byte =
        new Byte(123i8)

    @test
    def testInvokeConstructor06(): Short =
        new Short(123i16)

    @test
    def testInvokeConstructor07(): Integer =
        new Integer(123i32)

    @test
    def testInvokeConstructor08(): Long =
        new Long(123i64)

    @test
    def testInvokeConstructor09(): JString \ IO =
        new JString("Hello World")

    @test
    def testInvokePureConstructor01(): JString =
        unsafe new JString("Hello World")

    // This test doesn't pass unless explicit cast is done
    @test
    def testInvokeObjectConstructor01(): Object \ IO =
        let obj = new JString("Hello World");
        (checked_cast(obj) : Object)

    @test
    def testInvokeStaticNestedConstructor01(): Builder \ IO =
        new Builder()

    @test
    def testInvokeConstructorWithArrayParam(): URLClassLoader \ {Sys, Net, IO} = region rc {
        let arr : Array[URL, rc] = Array#{} @ rc;
        new URLClassLoader(arr)
    }
}
