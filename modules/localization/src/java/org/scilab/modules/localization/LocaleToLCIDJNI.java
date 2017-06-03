/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.7
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.scilab.modules.localization;


/* It is generated code. Disable checkstyle */
//CHECKSTYLE:OFF
/**
  * @author Allan CORNET
  * @copyright DIGITEO 2010
  */
public class LocaleToLCIDJNI {

    /**
      * Constructor
      */
    protected LocaleToLCIDJNI() {
        throw new UnsupportedOperationException();
    }

    static {
        try {
            System.loadLibrary("scilocalization");
        } catch (SecurityException e) {
            System.err.println("A security manager exists and does not allow the loading of the specified dynamic library.");
            System.err.println(e.getLocalizedMessage());
            e.printStackTrace(System.err);
        } catch (UnsatisfiedLinkError e)    {
            System.err.println("The native library scilocalization does not exist or cannot be found.");
            System.err.println(e.getLocalizedMessage());
            e.printStackTrace(System.err);
        }
    }

    public final static native String convert(String jarg1);
}