{
 BASS Full-duplex test  -- exemple de la nouvelle lib de Bass 2.3
 modification de la source liveFx (dispo dans Bass2.3 sur www.4unseen.com
 Il etait possible que d'activer le reverb , gargle , chorus  et flanger ( ms sans aucunes
 modifications supp ( donc flanger d'origine : pas marrant ) )

 Petit Bug (que je ne comprends pas d'ailleurs ... )
 ---------------------------------------------------
    Des fois (completement aleatoire chez moi ...)
    le programme démarre et la variable latency > 100
    --> RESULTAT : ben l'acquisition ne se realise +
    Chez moi cette variable = 29 (de moyenne ) qd tt va bien

    Bon maintenant autre chose = j'ai testé uniquement ce programme
    par rapport a l'entrée microphone ( il faut le mettre en mute dans le panneau principal
    de votre carte son ) et Line-IN(avec une basse , faut aussi mettre en mute)

    Bon je sais que par rapport au mixage stereo (son de votre ordi ) ca foire ...

    Autres choses :
      le tabFlanger , si je l'ai ecris en dur ds le source c'est parce que j'étais faineant de le
      mettre ds un fichier puis de le charger lire ... j'avais pas envie desolé !

      Et puis bon delire !!!!
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BASS, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    LTypeFlanger: TLabel;
    Reverb: TCheckBox;
    Chorus: TCheckBox;
    Flanger: TCheckBox;
    Gargle: TCheckBox;
    FlangerSon1: TPanel;
    Label14: TLabel;
    FFRS1: TLabel;
    FFS1: TLabel;
    FDS1: TLabel;
    FWS1: TLabel;
    FDeS1: TLabel;
    FWetS1: TTrackBar;
    FDeptS1: TTrackBar;
    FFeedS1: TTrackBar;
    FFreqS1: TTrackBar;
    FDelayS1: TTrackBar;
    TTabFlanger: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Echo: TCheckBox;
    Disto: TCheckBox;
    Compressor: TCheckBox;
    Reverb2: TCheckBox;
    Panel2: TPanel;
    TReverb9: TTrackBar;
    TReverb8: TTrackBar;
    TReverb7: TTrackBar;
    TReverb6: TTrackBar;
    TReverb5: TTrackBar;
    TReverb4: TTrackBar;
    TReverb3: TTrackBar;
    TReverb2: TTrackBar;
    TReverb12: TTrackBar;
    TReverb11: TTrackBar;
    TReverb10: TTrackBar;
    TReverb1: TTrackBar;
    Label7: TLabel;
    DelayRight: TTrackBar;
    DelayLeft: TTrackBar;
    Label8: TLabel;
    TCompression: TTrackBar;
    TDisto: TTrackBar;
    procedure ComboBox1Change(Sender: TObject);
    procedure ReverbClick(Sender: TObject);
    procedure ChorusClick(Sender: TObject);
    procedure FlangerClick(Sender: TObject);
    procedure GargleClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FWetS1Change(Sender: TObject);
    procedure FDeptS1Change(Sender: TObject);
    procedure FFeedS1Change(Sender: TObject);
    procedure FFreqS1Change(Sender: TObject);
    procedure FDelayS1Change(Sender: TObject);
    procedure TTabFlangerChange(Sender: TObject);
    procedure EchoClick(Sender: TObject);
    procedure DistoClick(Sender: TObject);
    procedure CompressorClick(Sender: TObject);
    procedure Reverb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ApplyFlanger();
    procedure ApplyReverb();
    procedure ApplyEcho();
    procedure ApplyCompress();
    procedure ApplyDisto();


    procedure CreerTabFlanger();
    procedure ChargerTabFlanger(val:integer);
  end;

  RFlanger = record   // Structure me permettant de retenir les valeurs des <> Trackbar
      name : string;  // dans le panel Flanger pour ensuite les recharger
      wet : integer;   // voir les procedures CreerTabFlanger(); et ChargerTabFlanger(val:integer);
      dept : integer;  // et TTabFlangerChange
      feed  : integer;
      freq : integer;
      delay : integer;
  end;


var
  Form1: TForm1;
  tabFlanger:array[0..10]of RFlanger; // je me creer un tableau de structure de type RFlanger
  fx : array [1..10] of HFX;          // 1 variable pr chaque effet

  // on se sert de ce type pr pouvoir
  //modifier plus en detail chaque effet chargé
  // regarder aide BASS sur www.4unseen.com
  // si vs comprenez pas ...
  fl : BASS_FXFLANGER;
  ch : BASS_FXCHORUS;
  rv : BASS_FXI3DL2REVERB;
  ec : BASS_FXECHO;
  co : BASS_FXCOMPRESSOR;
  di : BASS_FXDISTORTION;

  // variables d'origine du petit prog

  chan : HRECORD;  // recording channel
  pchan : HSTREAM;  // playback stream
  length : integer;  // FX handles
  latency : extended; // Current latency
  chunk : integer;


implementation

{$R *.dfm}
procedure TForm1.CreerTabFlanger();
begin
// Bon j'ai teste un peu le prog
// me suis amuse comme 1 dingue
// et j'ai note les effets assez
//marrant...

//certain ne marche pas avec la voix
//ms mieux avec la basse
  tabFlanger[0].name:='Default';
  tabFlanger[0].wet:=0;
  tabFlanger[0].dept:=25;
  tabFlanger[0].feed:=0;
  tabFlanger[0].freq:=0;
  tabFlanger[0].delay:=0;

  tabFlanger[1].name:='Electrique Soft';
  tabFlanger[1].wet:=11;
  tabFlanger[1].dept:=11;
  tabFlanger[1].feed:=-99;
  tabFlanger[1].freq:=8;
  tabFlanger[1].delay:=4;

  tabFlanger[2].name:='Electrique Hard';
  tabFlanger[2].wet:=33;
  tabFlanger[2].dept:=35;
  tabFlanger[2].feed:=-99;
  tabFlanger[2].freq:=2;
  tabFlanger[2].delay:=4;

  tabFlanger[3].name:='Electrique Heavy';
  tabFlanger[3].wet:=33;
  tabFlanger[3].dept:=35;
  tabFlanger[3].feed:=-99;
  tabFlanger[3].freq:=2;
  tabFlanger[3].delay:=1;

  tabFlanger[4].name:='Flanger Heavy';
  tabFlanger[4].wet:=60;
  tabFlanger[4].dept:=41;
  tabFlanger[4].feed:=4;
  tabFlanger[4].freq:=6;
  tabFlanger[4].delay:=2;

  tabFlanger[5].name:='Flanger Hard';
  tabFlanger[5].wet:=59;
  tabFlanger[5].dept:=34;
  tabFlanger[5].feed:=15;
  tabFlanger[5].freq:=9;
  tabFlanger[5].delay:=2;

  tabFlanger[6].name:='Flanger Soft';
  tabFlanger[6].wet:=39;
  tabFlanger[6].dept:=34;
  tabFlanger[6].feed:=16;
  tabFlanger[6].freq:=1;
  tabFlanger[6].delay:=1;

  tabFlanger[7].name:='Flanger';
  tabFlanger[7].wet:=39;
  tabFlanger[7].dept:=83;
  tabFlanger[7].feed:=4;
  tabFlanger[7].freq:=1;
  tabFlanger[7].delay:=4;

  tabFlanger[8].name:='Egout';
  tabFlanger[8].wet:=20;
  tabFlanger[8].dept:=42;
  tabFlanger[8].feed:=-92;
  tabFlanger[8].freq:=0;
  tabFlanger[8].delay:=1;

  tabFlanger[9].name:='Bizarre';
  tabFlanger[9].wet:=20;
  tabFlanger[9].dept:=70;
  tabFlanger[9].feed:=-92;
  tabFlanger[9].freq:=7;
  tabFlanger[9].delay:=4;

  tabFlanger[10].name:='Extra-Terrestre';
  tabFlanger[10].wet:=99;
  tabFlanger[10].dept:=78;
  tabFlanger[10].feed:=60;
  tabFlanger[10].freq:=8;
  tabFlanger[10].delay:=4;

end;

procedure TForm1.ApplyFlanger;
begin
BASS_FXGetParameters(fx[3], @fL);
     fL.fWetDryMix:=FWetS1.Position; //0 100
     fl.fDepth:=FDeptS1.Position;     //0 100
     fl.fFeedback:=FFeedS1.Position;     //-99..99
     fl.fFrequency:=FFreqS1.Position;  //0 10
     fl.fDelay:=FdelayS1.Position;          //0 4
BASS_FXSetParameters(fx[3], @fL);
end;

procedure TForm1.ApplyDisto;
begin
BASS_FXGetParameters(fx[8], @di);
     di.fEdge:= TDisto.Position;
BASS_FXSetParameters(fx[8], @di);

end;

procedure TForm1.ApplyReverb;
begin
// cette methode doit surement etre tres interresante ms
// je n'ai pas eu le courage de bien regarder au valeur
// surtout qd il faut travailler avec des virgules ...
// a completer

BASS_FXGetParameters(fx[10], @rv);
     rv.lRoom:=TReverb1.Position; //-10000 0
     rv.lRoomHF:=TReverb2.Position; //-1000 0
     rv.flRoomRolloffFactor:=TReverb3.Position; //0 10
     rv.flDecayTime:=TReverb4.Position;  //0.1 20
     rv.flDecayHFRatio:=TReverb5.Position;  //0.1 2
     rv.lReflections:=TReverb6.Position;  // -10000 1000
     rv.flReflectionsDelay:=0.007; // 0 0.3
     rv.lReverb:=TReverb8.Position; //-10000  2000
     rv.flReverbDelay:=0.11;  //0 0.1
     rv.flDiffusion:=TReverb10.Position; //0.0 100.0
     rv.flDensity:=TReverb11.Position; // 0.0 100
     rv.flHFReference:=TReverb12.Position; // 20 20000
BASS_FXSetParameters(fx[10], @rv);

end;
procedure TForm1.ApplyEcho;
begin
BASS_FXGetParameters(fx[7], @ec);
     ec.fLeftDelay:=DelayLeft.Position;
     ec.fRightDelay:=DelayRight.Position;
BASS_FXSetParameters(fx[7], @ec);
end;

procedure TForm1.ApplyCompress;
begin
BASS_FXGetParameters(fx[9], @co);
   co.fGain:=Tcompression.Position;
BASS_FXSetParameters(fx[9], @co);

end;



procedure TForm1.ChargerTabFlanger(val:integer);
begin
//charge la structure cree ds CreerTabFlanger();
  LTypeFlanger.Caption:=tabFlanger[val].name;
  FWetS1.Position:=tabFlanger[val].wet;
  FDeptS1.Position:=tabFlanger[val].dept;
  FFeedS1.Position:=tabFlanger[val].feed;
  FFreqS1.Position:=tabFlanger[val].freq;
  FDelayS1.Position:=tabFlanger[val].delay;
end;


// fonction prog d'origine meme pas regardé
function stream(handle: HSTREAM; buffer: Pointer; length: DWORD; user: DWORD): Cardinal; stdcall;
var
  c : integer;
begin
c := BASS_ChannelGetData(chan, 0, BASS_DATA_AVAILABLE);
if (c > (2 * (chunk + 1764))) then
  BASS_ChannelGetData(chan, 0, c);
c := BASS_ChannelGetData(chan, buffer, length);

Result := c;
end;
// fonction prog d'origine meme pas regardé
procedure TForm1.ComboBox1Change(Sender: TObject);
var
	i: Integer;
    r: Boolean;
begin
	// enable the selected input
    r := True;
    i := 0;
    // first disable all inputs, then...
	while r do
    begin
		r := BASS_RecordSetInput(i, BASS_INPUT_OFF);
        Inc(i);
	end;
    // ...enable the selected.
	BASS_RecordSetInput(ComboBox1.ItemIndex, BASS_INPUT_ON);
end;

// Ici on va teste a chaque fois si les checkbox des <>effet
//sont checker et si c'est le cas , on applique l'effet
//au son ... sinon on l'enleve ...
// selon les effets on peut parametrer un peu plus
//comme Flanger , Reverb et Echo

procedure TForm1.ReverbClick(Sender: TObject);
begin
if Reverb.Checked = true then
  fx[1] := BASS_ChannelSetFX(pchan,BASS_FX_REVERB,0)
else
  BASS_ChannelRemoveFX(pchan,fx[1]);
end;

procedure TForm1.ChorusClick(Sender: TObject);
begin
if Chorus.Checked = true then
  fx[2] := BASS_ChannelSetFX(pchan,BASS_FX_CHORUS,0)

else
  BASS_ChannelRemoveFX(pchan,fx[2]);
end;

procedure TForm1.FlangerClick(Sender: TObject);
begin

if Flanger.Checked = true then
  fx[3] := BASS_ChannelSetFX(pchan,BASS_FX_FLANGER,0)
else
  BASS_ChannelRemoveFX(pchan,fx[3]);
end;

procedure TForm1.GargleClick(Sender: TObject);
begin
if Gargle.Checked = true then
  fx[4] := BASS_ChannelSetFX(pchan,BASS_FX_GARGLE,0)
else
  BASS_ChannelRemoveFX(pchan,fx[4]);
end;
procedure TForm1.EchoClick(Sender: TObject);
begin
if Echo.Checked = true then
  fx[7] := BASS_ChannelSetFX(pchan,BASS_FX_ECHO,0)
else
  BASS_ChannelRemoveFX(pchan,fx[7]);

end;

procedure TForm1.DistoClick(Sender: TObject);
begin
if Disto.Checked = true then
  fx[8] := BASS_ChannelSetFX(pchan,BASS_FX_DISTORTION,0)
else
  BASS_ChannelRemoveFX(pchan,fx[8]);
end;

procedure TForm1.CompressorClick(Sender: TObject);
begin
if Compressor.Checked = true then
  fx[9] := BASS_ChannelSetFX(pchan,BASS_FX_COMPRESSOR,0)
else
  BASS_ChannelRemoveFX(pchan,fx[9]);
end;

procedure TForm1.Reverb2Click(Sender: TObject);
begin
if Reverb2.Checked = true then
  fx[10] := BASS_ChannelSetFX(pchan,BASS_FX_I3DL2REVERB,0)
else
  BASS_ChannelRemoveFX(pchan,fx[10]);

end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  //  prog d'origine meme pas regardé
	latency :=(latency*3+BASS_ChannelGetData(pchan,0,BASS_DATA_AVAILABLE)
  +BASS_ChannelGetData(chan,0,BASS_DATA_AVAILABLE))/4;

  Label2.Caption := inttostr(round(latency*1000/176400));

  //si Flanger est coché alors on applique le flanger + les modifs
  //et on peut choisir les banques pre-selectionnes grace a la trackbar

if Flanger.Checked=true then
begin
  ApplyFlanger;
  TTabFlanger.SliderVisible:=true;
end
else
TTabFlanger.SliderVisible:=false;

// meme principe ...
if Reverb2.Checked=true then ApplyReverb;
if Echo.Checked=true then ApplyEcho;
if compressor.Checked=true then ApplyCompress;
if disto.Checked=true then ApplyDisto;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  // fonction prog d'origine meme pas regardé
	BASS_RecordSetInput(ComboBox1.ItemIndex, BASS_INPUT_LEVEL or TrackBar1.Position);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : bass_info;
  a,b: Integer;
  dName: PChar;
begin

   // colorie la form en rouge 
   Form1.Color:=rgb(255,115,75);
   Panel1.Color:=rgb(215,100,75);
   Panel2.Color:=rgb(215,100,75);
   FlangerSon1.Color:=rgb(195,95,75);

  // fonction prog d'origine meme pas regardé

	if (HIWORD(BASS_GetVersion) <> BASSVERSION) then
	begin
		MessageBox(0,'An incorrect version of BASS.DLL was loaded',0,MB_ICONERROR);
		Halt;
	end;
  Latency := 0;
	BASS_SetConfig(BASS_CONFIG_UPDATEPERIOD,10);
	// setup output - get device latency
	if not BASS_Init(-1,44100,BASS_DEVICE_LATENCY,Application.Handle,nil) then
    begin
		  ShowMessage('Can''t initialize device');
		  Exit;
	  end;

	BASS_GetInfo(i);
	// buffer size = update period x2 + 'minbuf'
	BASS_SetConfig(BASS_CONFIG_BUFFER,20+i.minbuf);

  BASS_RecordInit(-1);
  chan := BASS_RecordStart(44100,2,0,nil,0); // Recording Channel
  pchan := BASS_StreamCreate(44100,2,0,@stream,0);  //Playing Channel
  BASS_ChannelPlay(pchan,False); // Start Playing
  Timer1.Enabled := True;  // Start the latency timer

  // Populate the list
	a := 0;
  dName := BASS_RecordGetInputName(a);
	while dName <> nil do
	begin
		ComboBox1.Items.Add(StrPas(dName));
		// is this one currently "on"?
		if (BASS_RecordGetInput(a) and BASS_INPUT_OFF) = 0 then
        	ComboBox1.ItemIndex := a;
		Inc(a);
		dName := BASS_RecordGetInputName(a);
	end;
    ComboBox1Change(Self);	// display info
	b := BASS_RecordGetInput(ComboBox1.ItemIndex);
	TrackBar1.Position := LoWord(b);	// set the level slider

  // creer le tableau de structure ...
  CreerTabFlanger;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
BASS_Free(); // libere bass;
end;

// on affiche les infos des track Flanger ... ds des label
procedure TForm1.FWetS1Change(Sender: TObject);
begin
FWS1.Caption:=inttostr(FWetS1.Position);
end;

procedure TForm1.FDeptS1Change(Sender: TObject);
begin
FDS1.Caption:=inttostr(FDeptS1.Position);
end;

procedure TForm1.FFeedS1Change(Sender: TObject);
begin
FFS1.Caption:=inttostr(FFeedS1.Position);
end;

procedure TForm1.FFreqS1Change(Sender: TObject);
begin
FFRS1.Caption:=inttostr(FFreqS1.position);
end;

procedure TForm1.FDelayS1Change(Sender: TObject);
begin
FDeS1.Caption:=inttostr(FdelayS1.position);
end;

procedure TForm1.TTabFlangerChange(Sender: TObject);
begin
// charge les banque grace a la structure ...
ChargerTabFlanger(TTabFlanger.Position);
end;

end.

