#include "hbunit.ch"

CLASS TMock

  DATA cClassName AS CHAR INIT ""
  DATA cCalledMethod AS CHAR INIT ""
  DATA aArgs AS ARRAY INIT {}
  DATA returnValue

  METHOD new( cClassName ) CONSTRUCTOR
  METHOD whenCalling( cMethodName )
  METHOD withArgs( aArgs )
  METHOD shouldReturn( returnValue )

ENDCLASS

METHOD new( cClassName ) CLASS TMock
  LOCAL uReturnValue := .F.

  IF( VALTYPE(cClassName) == "C" )
    ::cClassName := cClassName
    uReturnValue := self
  ENDIF

  RETURN ( uReturnValue )

METHOD whenCalling( cMethodName ) CLASS TMock

  ::cCalledMethod := cMethodName

  RETURN ( self )

METHOD withArgs() CLASS TMock
  LOCAL nArgs := PCount(), ;
        i

  FOR i := 1 TO nArgs
    AADD( ::aArgs, PValue( i ) )
  NEXT

  RETURN ( self )

METHOD shouldReturn( returnValue ) CLASS TMock

  ::returnValue := returnValue

  RETURN ( self )