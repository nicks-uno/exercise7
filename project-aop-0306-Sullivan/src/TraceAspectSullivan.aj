import org.aspectj.lang.Signature;

public aspect TraceAspectSullivan {
//	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): within(*App) && execution(String getName());
	
	before(): methodToTrace() {
		Signature sig = thisJoinPointStaticPart.getSignature();
		String linenum = Integer.toString(thisJoinPointStaticPart.getSourceLocation().getLine());
		String toPrint = "[BGN] " + sig.toString() + ", " + linenum;
		System.out.println(toPrint);
	};
	after(): methodToTrace() {
		String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] " + fileName);
	};
}
