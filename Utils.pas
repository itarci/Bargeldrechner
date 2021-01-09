unit Utils;

interface

uses
  Winapi.Windows, System.SysUtils ,System.Classes;

type
  TFunktion = class(TObject)
  private

  public
    function ReadVerInfo(const fn: string; var Desc: string;
      const lv: integer = 0; const ky: string = ''): string;
  end;

var
  Funktion: TFunktion;

implementation


function TFunktion.ReadVerInfo(const fn: string; var Desc: string;
  const lv: integer = 0; const ky: string = ''): string;
var
  VerHandle, VerSize: DWORD;
  pItem, pVerInfo: Pointer;
  FixedFileInfo: PVSFixedFileInfo;
  il: UINT;
  version, key: string;
  sRes, LangS, CharS: string;
  pFName: array [0 .. MAX_PATH - 1] of Char;
begin
  version := '';
  Desc := '';
  sRes := '';
  if fn <> '' then
  begin
    StrPCopy(pFName, fn);
    VerHandle := 0;
    VerSize := GetFileVersionInfoSize(pFName, VerHandle);
    if VerSize = 0 then
      Exit;
    GetMem(pVerInfo, VerSize);
    try
      if GetFileVersionInfo(pFName, VerHandle, VerSize, pVerInfo) then
      begin
        LangS := '0409';
        CharS := '04E4';
        il := 0;
        pItem := nil;
        FixedFileInfo := nil;
        if VerQueryValue(pVerInfo, '\VarFileInfo\Translation', pItem, il) then
        begin
          LangS := IntToHex(integer(pItem^) and $0000FFFF, 4);
          CharS := IntToHex(((integer(pItem^) and $FFFF0000) shr 16) and
            $FFFF, 4);
        end;
        if VerQueryValue(pVerInfo, '\', Pointer(FixedFileInfo), il) then
          with FixedFileInfo^ do
            version := IntToStr(HiWord(dwFileVersionMS)) + '.' +
              IntToStr(LoWord(dwFileVersionMS)) + '.' +
              IntToStr(HiWord(dwFileVersionLS)) + '.' +
              IntToStr(LoWord(dwFileVersionLS));
        key := ky;
        if key = '' then
          key := 'FileDescription';
        if VerQueryValue(pVerInfo, PChar('\StringFileInfo\' + LangS + CharS +
          '\' + key), pItem, il) then
          Desc := PChar(pItem);
        if VerQueryValue(pVerInfo, PChar('\StringFileInfo\' + LangS + CharS +
          '\FileVersion'), pItem, il) then
          version := PChar(pItem);
      end;
    finally
      FreeMem(pVerInfo, VerSize);
      sRes := version;
      if lv <> 0 then
      begin
        sRes := '';
        if version[length(version)] <> '.' then
          version := version + '.';
        for il := 1 to lv do
        begin
          if sRes <> '' then
            sRes := sRes + '.';
          sRes := sRes + copy(version, 1, pos('.', version) - 1);
          version := copy(version, pos('.', version) + 1, length(version));
        end;
      end;
    end;
  end;
  ReadVerInfo := sRes;
end;

end.
