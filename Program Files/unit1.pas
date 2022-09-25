unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, DBCtrls, LazHelpHTML, LCLIntf;

type

  { TFm1 }

  TFm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    Chb2: TCheckBox;
    Chb3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private

  public

  end;

var
  Fm1: TFm1;
  s1, s2, s3, s4, s5, s6: string;
  i, f, t: integer;
  summ, cen: real;

implementation

{$R *.lfm}

{ TFm1 }

procedure TFm1.Button1Click(Sender: TObject);
begin
  if LabeledEdit1.Text = '' then LabeledEdit1.Text := '0';
  if LabeledEdit2.Text = '' then LabeledEdit2.Text := '0';
  if LabeledEdit3.Text = '' then LabeledEdit3.Text := '0';
  if LabeledEdit4.Text = '' then LabeledEdit4.Text := '0';
  if LabeledEdit6.Text = '' then LabeledEdit6.Text := '0';
  if LabeledEdit7.Text = '' then LabeledEdit7.Text := '1';
  if LabeledEdit8.Text = '' then LabeledEdit8.Text := '0';

  if (Chb2.State = cbChecked) and (Chb3.State = cbUnChecked) then begin
    s3 := ''; i := 0; f := 0; t := 0;
    s1 := LabeledEdit1.Text; s2 := LabeledEdit2.Text;
    if RadioButton1.Checked then
    begin
      if not (CheckBox1.Checked) then
        s3 += '/ah sell ' + FloatToStr(round(64 * StrToFloat(s2))) + #13
      else
        s3 += '/ah sell ' + FloatToStr(round(64 * StrToFloat(s2))) + ' full' + #13;

      Memo1.Text := 'ВВЕДЕНЫЕ ЗНАЧЕНИЯ' + #13
         + 'Кол-во предметов - ' + s1 + #13
         + 'Цена за один предмет - ' + s2 + #13 + #13
         + 'СПИСОК ВВОДИМЫХ КОМАНД' + #13
         + s3 + #13 + #13
         + 'ИНФОРМАЦИЯ О ПРОДАЖЕ' + #13
         + 'Нужное кол-во позиций для выставления на подажу - ' + s1 + #13
         + 'Выручка со всей продажи - ' + FloatToStr(round(64 * StrToFloat(s2)) * StrToInt(s1));
    end
    else
    if RadioButton2.Checked then
    begin
      t := StrToInt(s1); f := 64; summ := 0; i := 0;
      if not (CheckBox1.Checked) then
        while t > 0 do
        begin
          if t < f then
          begin
            f := t;
            if i <> 0 then
              s3 += '   | ' + FloatToStr(i) + ' раз(-а)' + #13 + '/ah sell ' + FloatToStr(round(f * StrToFloat(s2))) + #13
            else s3 += '/ah sell ' + FloatToStr(round(f * StrToFloat(s2))) + #13;
          end
          else if i = 0 then s3 += '/ah sell ' + FloatToStr(round(f * StrToFloat(s2)));
          t -= 64; summ += round(f * StrToFloat(s2)); i += 1;
        end
      else
        while t > 0 do
        begin
          if t < f then
          begin
            f := t;
            if i <> 0 then
              s3 += ' full  | ' + FloatToStr(i) + ' раз(-а)' + #13 + '/ah sell ' + FloatToStr(round(f * StrToFloat(s2))) + ' full' + #13
            else s3 += '/ah sell ' + FloatToStr(round(f * StrToFloat(s2))) + ' full' + #13;
          end
          else if i = 0 then s3 += '/ah sell ' + FloatToStr(round(f * StrToFloat(s2)));
          t -= 64; summ += round(f * StrToFloat(s2)); i += 1;
        end;


      Memo1.Text := 'ВВЕДЕНЫЕ ЗНАЧЕНИЯ' + #13
         + 'Кол-во предметов - ' + s1 + #13
         + 'Цена за один предмет - ' + s2 + #13 + #13
         + 'СПИСОК ВВОДИМЫХ КОМАНД' + #13
         + s3 + #13 + #13
         + 'ИНФОРМАЦИЯ О ПРОДАЖЕ' + #13
         + 'Нужное кол-во позиций для выставления на подажу - ' + FloatToStr(i) + #13
         + 'Выручка со всей продажи - ' + FloatToStr(summ);
    end;
  end
  else if (Chb3.State = cbChecked) and (Chb2.State = cbUnChecked) then begin
    s3 := ''; i := 0; f := 0; t := 0;
    s1 := LabeledEdit3.Text; s2 := LabeledEdit4.Text; s4 := LabeledEdit6.Text; s5 := LabeledEdit7.Text; s6 := LabeledEdit8.Text;

    RadioButton1.Checked := False; RadioButton2.Checked := False;

    t := StrToInt(s1) * StrToInt(s6) + StrToInt(s2); f := StrToInt(s1); summ := 0; i := 0; cen := StrToFloat(s4) / StrToFloat(s5);
    if not (CheckBox1.Checked) then
      while t > 0 do
      begin
        if t < f then
        begin
          f := t;
          if i <> 0 then
            s3 += '   | ' + FloatToStr(i) + ' раз(-а)' + #13 + '/ah sell ' + FloatToStr(round(f * cen)) + #13
          else s3 += '/ah sell ' + FloatToStr(round(f * cen)) + #13;
        end
        else if i = 0 then s3 += '/ah sell ' + FloatToStr(round(f * cen));
        t -= f; summ += round(f * cen); i += 1;
      end
    else
      while t > 0 do
      begin
        if t < f then
        begin
          f := t;
          if i <> 0 then
            s3 += ' full  | ' + FloatToStr(i) + ' раз(-а)' + #13 + '/ah sell ' + FloatToStr(round(f * cen)) + ' full' + #13
          else s3 += '/ah sell ' + FloatToStr(round(f * cen)) + ' full' + #13;
        end
        else if i = 0 then s3 += '/ah sell ' + FloatToStr(round(f * cen));
        t -= f; summ += round(f * cen); i += 1;
      end;

    Memo1.Text := 'ВВЕДЕНЫЕ ЗНАЧЕНИЯ' + #13
    + 'Кол-во предметов - ' + s1 + #13
    + 'Цена за один предмет - ' + s2 + #13 + #13
    + 'СПИСОК ВВОДИМЫХ КОМАНД' + #13
    + s3 + #13 + #13
    + 'ИНФОРМАЦИЯ О ПРОДАЖЕ' + #13
    + 'Нужное кол-во позиций для выставления на подажу - ' + FloatToStr(i) + #13
    + 'Выручка со всей продажи - ' + FloatToStr(summ);
  end;
end;

procedure TFm1.Button2Click(Sender: TObject);
begin
  OpenURL('https://nikita06-dotcom.github.io/Minecraft_sales.github.io/');
end;

procedure TFm1.Button3Click(Sender: TObject);
begin
  LabeledEdit3.Text := '16';
end;

procedure TFm1.Button4Click(Sender: TObject);
begin
  LabeledEdit3.Text := '64';
end;

procedure TFm1.Button5Click(Sender: TObject);
begin
  OpenURL('https://discord.gg/k2uaMkfnvs');
end;

end.
