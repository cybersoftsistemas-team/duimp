unit duimp.pre.view.System.Loading;

interface

uses
{IDE}
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
{PROJECT}
  duimp.pre.view.System.LoadFormDef;

type
  TShowLoadingEvent<TLoadForm: TfrmLoadDef> = reference to procedure(const AfrmLoad: TLoadForm);

  Load = class
  strict private
    class procedure SearchException(const AE: Exception); static;
  public
    class procedure ShowLoading(const ATarget: TWinControl; const AEvent: TProc); overload; static;
    class procedure ShowLoading<TLoadForm: TfrmLoadDef>(const ATarget: TWinControl;
      const AEvent: TShowLoadingEvent<TLoadForm>; const AShowLoadForm: Boolean); overload; static;
  end;

implementation

uses
{IDE}
  System.Threading,
  System.UITypes,
  Vcl.Dialogs,
  Vcl.Forms,
{PROJECT}
  duimp.pre.view.System.LoadingForm;

{ Load }

class procedure Load.SearchException(const AE: Exception);
begin
  MessageDlg(AE.Message, mtError, [mbOK], 0);
end;

class procedure Load.ShowLoading(const ATarget: TWinControl; const AEvent: TProc);
begin
  TTask.Run(
    procedure
    var
      LLoading: TfrmLoading;
    begin
      try
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            LLoading := TfrmLoading.Create(nil);
            LLoading.Parent := ATarget;
            LLoading.Show;
          end);
        try
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              AEvent;
            end);
        finally
          TThread.Queue(TThread.CurrentThread,
            procedure
            begin
              LLoading.Close;
              FreeAndNil(LLoading);
            end);
        end;
      except
        on E: Exception do
        begin
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              SearchException(E);
            end);
        end;
      end;
    end);
end;

class procedure Load.ShowLoading<TLoadForm>(const ATarget: TWinControl; const AEvent: TShowLoadingEvent<TLoadForm>;
  const AShowLoadForm: Boolean);
begin
  TTask.Run(
    procedure
    var
      LLoad: TLoadForm;
      LLoading: TfrmLoading;
    begin
      try
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            LLoading := TfrmLoading.Create(nil);
            LLoading.Parent := ATarget;
            LLoading.Show;
          end);
        try
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              LLoad := TLoadForm.Create(ATarget);
              if AShowLoadForm then
              begin
                LLoad.Show;
              end;
            end);
          try
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                AEvent(LLoad);
              end);
          finally
            TThread.Queue(TThread.CurrentThread,
              procedure
              begin
                LLoad.Close;
                FreeAndNil(LLoad);
              end);
          end;
        finally
          TThread.Queue(TThread.CurrentThread,
            procedure
            begin
              LLoading.Close;
              FreeAndNil(LLoading);
            end);
        end;
      except
        on E: Exception do
        begin
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              SearchException(E);
            end);
        end;
      end;
    end);
end;

end.
