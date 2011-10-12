{-------------------------------------------------------------------------------
KATA NUMEROS ROMANOS

DESCRIPCION
https://github.com/12meses12katas/Febrero-Roman-Numerals#

USO
Para usar el sistema basta lanzar el ejecutable de los siguientes modos:
* Modo UI por defecto. Incluir -autorun para ejecutar automaticamente
* Modo Consola. Ejecutar con parametro -h

DESARROLLO

Plataforma  : Windows XP SP2 y Delphi 7 Enterprise

Historial   :
  - version 1.0 (01/03/2011)

TODO        : <tareas pendientes de realizar>
  - Especificar documentacion en codigo
  - Controlar numeros romanos incorrectos
-------------------------------------------------------------------------------}

{$APPTYPE CONSOLE}

program NumerosRomanos;

uses
  FastMM4,
  Forms,
  sysutils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  uNumerosRomanos_Test in 'uNumerosRomanos_Test.pas',
  uNumerosRomanos in 'uNumerosRomanos.pas';

{$R *.res}

begin
  if FindCmdLineSwitch('h', ['-', '/'], true) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
  begin
    Application.Initialize;
    GUITestRunner.RunRegisteredTests;
  end;
end.

