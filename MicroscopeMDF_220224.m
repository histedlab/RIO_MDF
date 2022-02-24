% Most Software Machine Data File

%% scanimage.SI (ScanImage)

% Global microscope properties
objectiveResolution = 76.8;     % Resolution of the objective in microns/degree of scan angle

% Data file location

% Custom Scripts
startUpScript = '';     % Name of script that is executed in workspace 'base' after scanimage initializes
shutDownScript = '';     % Name of script that is executed in workspace 'base' after scanimage exits

fieldCurvatureZs = [];     % Field curvature for mesoscope
fieldCurvatureRxs = [];     % Field curvature for mesoscope
fieldCurvatureRys = [];     % Field curvature for mesoscope
useJsonHeaderFormat = false;     % Use JSON format for TIFF file header

%% scanimage.components.Motors (SI Motors)
% SI Stage/Motor Component.
motorXYZ = {'thorlabs MCM3001' 'thorlabs MCM3001' 'thorlabs MCM3001'};     % Defines the motor for ScanImage axes X Y Z.
motorAxisXYZ = [1 2 3];     % Defines the motor axis used for Scanimage axes X Y Z.
scaleXYZ = [1 1 1];     % Defines scaling factors for axes.
backlashCompensation = [0 0 0];     % Backlash compensation in um (positive or negative)

%% scanimage.components.Photostim (SI Photostim)
photostimScannerName = 'LinScanner';     % Name of scanner (from first MDF section) to use for photostimulation. Must be a linear scanner

% Monitoring DAQ AI channels
BeamAiId = '';     % AI channel to be used for monitoring the Pockels cell output

loggingStartTrigger = '';     % PFI line to which start trigger for logging is wired to photostim board. Leave empty for automatic routing via PXI bus

stimActiveOutputChannel = '/PXI1Slot5/port0/line0';     % Digital terminal on stim board to output stim active signal. (e.g. on vDAQ: 'D2.6' on NI-DAQ hardware: '/port0/line0'
beamActiveOutputChannel = '/PXI1Slot5/port0/line1';     % Digital terminal on stim board to output beam active signal. (e.g. on vDAQ: 'D2.7' on NI-DAQ hardware: '/port0/line1'
slmTriggerOutputChannel = '/PXI1Slot5/port0/line2';     % Digital terminal on stim board to trigger SLM frame flip. (e.g. on vDAQ: 'D2.5' on NI-DAQ hardware: '/port0/line2'

%% dabs.generic.DigitalShutter (Main Shutter)
DOControl = '/PXI1Slot4/PFI0';     % control terminal  e.g. '/vDAQ0/DIO0'
invertOutput = false;     % invert output drive signal to shutter
openTime_s = 0.1;     % settling time for shutter in seconds

%% dabs.generic.ResonantScannerAnalog (Resonant Scanner)
AOZoom = '/PXI1Slot3/AO0';     % zoom control terminal  e.g. '/vDAQ0/AO0'
DOEnable = '';     % digital enable terminal e.g. '/vDAQ0/D0.1'
DISync = '/PXI1Slot3/PFI0';     % digital sync terminal e.g. '/vDAQ0/D0.0'

nominalFrequency = 7910;     % nominal resonant frequency in Hz
angularRange = 15;     % total angular range in optical degrees (e.g. for a resonant scanner with -13..+13 optical degrees, enter 26)
voltsPerOpticalDegrees = 0.3333;     % volts per optical degrees for the control signal
settleTime = 0.5;     % settle time in seconds to allow the resonant scanner to turn on

% Calibration Settings
amplitudeToLinePhaseMap = [7.5 -5.0625e-06;15 -5.0625e-06];     % translates an amplitude (degrees) to a line phase (seconds)
amplitudeToFrequencyMap = [0.483871 7928.99;0.5 7930.66;0.652174 7929.77;0.714286 7926.86;1.5 7928.58;2.5 7929.55;3 7924.34;3.75 7923.11;5 7926.68;6 7928.11;6.25 7925.01;7.5 7932.86;10 7927.5;13.6364 7914.45;15 7930.5];     % translates an amplitude (degrees) to a resonant frequency (Hz)
amplitudeLUT = zeros(0,2);     % translates a nominal amplitude (degrees) to an output amplitude (degrees)

%% dabs.generic.GalvoPureAnalog (y Galvo)
AOControl = '/PXI1Slot3/AO1';     % control terminal  e.g. '/vDAQ0/AO0'
AOOffset = '';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '';     % feedback terminal e.g. '/vDAQ0/AI0'

angularRange = 15;     % total angular range in optical degrees (e.g. for a galvo with -20..+20 optical degrees, enter 40)
voltsPerOpticalDegrees = 1;     % volts per optical degrees for the control signal
parkPosition = -7.5;     % park position in optical degrees
slewRateLimit = Inf;     % Slew rate limit of the analog output in Volts per second

% Calibration settings
feedbackVoltLUT = zeros(0,2);     % [Nx2] lut translating feedback volts into position volts
offsetVoltScaling = 1;     % scalar factor for offset volts

%% dabs.generic.GalvoPureAnalog (Stim x Galvo)
AOControl = '/PXI1Slot5/AO0';     % control terminal  e.g. '/vDAQ0/AO0'
AOOffset = '';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '';     % feedback terminal e.g. '/vDAQ0/AI0'

angularRange = 15;     % total angular range in optical degrees (e.g. for a galvo with -20..+20 optical degrees, enter 40)
voltsPerOpticalDegrees = 1;     % volts per optical degrees for the control signal
parkPosition = -7.5;     % park position in optical degrees
slewRateLimit = Inf;     % Slew rate limit of the analog output in Volts per second

% Calibration settings
feedbackVoltLUT = zeros(0,2);     % [Nx2] lut translating feedback volts into position volts
offsetVoltScaling = 1;     % scalar factor for offset volts

%% dabs.generic.GalvoPureAnalog (Stim y Galvo)
AOControl = '/PXI1Slot5/AO1';     % control terminal  e.g. '/vDAQ0/AO0'
AOOffset = '';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '';     % feedback terminal e.g. '/vDAQ0/AI0'

angularRange = 15;     % total angular range in optical degrees (e.g. for a galvo with -20..+20 optical degrees, enter 40)
voltsPerOpticalDegrees = -1;     % volts per optical degrees for the control signal
parkPosition = -7.5;     % park position in optical degrees
slewRateLimit = Inf;     % Slew rate limit of the analog output in Volts per second

% Calibration settings
feedbackVoltLUT = zeros(0,2);     % [Nx2] lut translating feedback volts into position volts
offsetVoltScaling = 1;     % scalar factor for offset volts

%% dabs.meadowlark.MeadowlarkSlm1920 (SLM)
lutFile = 'C:\Program Files\Meadowlark Optics\Blink OverDrive Plus\LUT Files\slm4877_at1064_PCIe.lut';     % Absolute Path to the SLM look up table file. e.g. 'C:\pathToLutFile\myLut.lut' Note: this lut file is loaded directly to the hardware. The ScanImage software LUT is applied on top of the hardware LUT.

%% dabs.generic.BeamModulatorFastAnalog (Resonant Laser)
AOControl = '/PXI1Slot4/AO0';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '/PXI1Slot4/AI0';     % feedback terminal e.g. '/vDAQ0/AI0'

outputRange_V = [0 1.5];     % Control output range in Volts
feedbackUsesRejectedLight = false;     % Indicates if photodiode is in rejected path of beams modulator.
calibrationOpenShutters = {'Main Shutter'};     % List of shutters to open during the calibration. (e.g. {'Shutter1' 'Shutter2'}

powerFractionLimit = 1;     % Maximum allowed power fraction (between 0 and 1)

% Calibration data
powerFraction2ModulationVoltLut = [0 0.136364;0.000312449 0.151515;0.00154991 0.166667;0.00371754 0.181818;0.00683164 0.19697;0.0108948 0.212121;0.0158399 0.227273;0.0217295 0.242424;0.0285288 0.257576;0.0362476 0.272727;0.0447833 0.287879;0.0541755 0.30303;0.0642988 0.318182;0.0752061 0.333333;0.0867878 0.348485;0.0991972 0.363636;0.112492 0.378788;0.126634 0.393939;0.141559 0.409091;0.156852 0.424242;0.173067 0.439394;0.18991 0.454545;0.207163 0.469697;0.224744 0.484848;0.242966 0.5;0.261715 0.515152;0.281271 0.530303;0.300983 0.545455;0.321386 0.560606;0.342178 0.575758;0.363016 0.590909;0.383854 0.606061;0.404856 0.621212;0.425934 0.636364;0.447631 0.651515;0.469352 0.666667;0.491136 0.681818;0.512903 0.69697;0.534884 0.712121;0.556821 0.727273;0.578964 0.742424;0.600814 0.757576;0.622021 0.772727;0.642991 0.787879;0.663629 0.80303;0.683852 0.818182;0.703841 0.833333;0.723481 0.848485;0.742722 0.863636;0.761523 0.878788;0.780514 0.893939;0.798693 0.909091;0.815951 0.924242;0.832303 0.939394;0.848582 0.954545;0.864104 0.969697;0.878779 0.984848;0.892631 1;0.905516 1.01515;0.917996 1.0303;0.929724 1.04545;0.940265 1.06061;0.950535 1.07576;0.959983 1.09091;0.968344 1.10606;0.975619 1.12121;0.982096 1.13636;0.987636 1.15152;0.992095 1.16667;0.995575 1.18182;0.998012 1.19697;0.999419 1.21212;1 1.22727];
powerFraction2PowerWattLut = zeros(0,2);
powerFraction2FeedbackVoltLut = [0 0.0313502;1 3.23405];
feedbackOffset_V = 0;

% Advanced Settings. Note: these settings are unused for vDAQ based systems
modifiedLineClockIn = '';     % Terminal to which external beam trigger is connected. Leave empty for automatic routing via PXI/RTSI bus
frameClockIn = '';     % Terminal to which external frame clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockIn = '';     % Terminal to which external reference clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockRate = 1e+07;     % if referenceClockIn is used, referenceClockRate defines the rate of the reference clock in Hz. Default: 10e6Hz

%% dabs.generic.BeamModulatorFastAnalog (Stim Laser)
AOControl = '/PXI1Slot5/AO2';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '/PXI1Slot5/AI0';     % feedback terminal e.g. '/vDAQ0/AI0'

outputRange_V = [0 5];     % Control output range in Volts
feedbackUsesRejectedLight = false;     % Indicates if photodiode is in rejected path of beams modulator.
calibrationOpenShutters = {'Main Shutter'};     % List of shutters to open during the calibration. (e.g. {'Shutter1' 'Shutter2'}

powerFractionLimit = 1;     % Maximum allowed power fraction (between 0 and 1)

% Calibration data
powerFraction2ModulationVoltLut = [0 0.454545;8.19547e-07 0.505051;2.2861e-06 0.555556;4.79846e-06 0.606061;9.04187e-06 0.656566;1.66302e-05 0.707071;3.2143e-05 0.757576;5.99238e-05 0.808081;0.000108157 0.858586;0.000194334 0.909091;0.000366318 0.959596;0.000649535 1.0101;0.00111817 1.06061;0.00184019 1.11111;0.00292206 1.16162;0.00442263 1.21212;0.00644586 1.26263;0.00910511 1.31313;0.0124785 1.36364;0.0165803 1.41414;0.0214922 1.46465;0.0273608 1.51515;0.0339688 1.56566;0.0415548 1.61616;0.0499878 1.66667;0.0596964 1.71717;0.0703101 1.76768;0.0820936 1.81818;0.0947797 1.86869;0.10832 1.91919;0.123118 1.9697;0.139056 2.0202;0.155617 2.07071;0.173231 2.12121;0.191806 2.17172;0.211962 2.22222;0.232576 2.27273;0.254955 2.32323;0.278134 2.37374;0.30053 2.42424;0.323857 2.47475;0.347344 2.52525;0.372023 2.57576;0.397667 2.62626;0.423719 2.67677;0.448644 2.72727;0.474395 2.77778;0.500188 2.82828;0.526035 2.87879;0.551154 2.92929;0.578128 2.9798;0.603552 3.0303;0.628018 3.08081;0.652852 3.13131;0.677126 3.18182;0.699838 3.23232;0.722956 3.28283;0.746288 3.33333;0.766512 3.38384;0.787404 3.43434;0.806287 3.48485;0.829572 3.53535;0.844256 3.58586;0.862792 3.63636;0.877824 3.68687;0.894049 3.73737;0.906645 3.78788;0.914441 3.83838;0.924053 3.88889;0.937961 3.93939;0.949496 3.9899;0.957468 4.0404;0.964889 4.09091;0.972377 4.14141;0.976589 4.19192;0.986612 4.24242;0.990942 4.29293;0.994976 4.34343;0.998249 4.39394;0.998323 4.44444;1 4.49495];
powerFraction2PowerWattLut = zeros(0,2);
powerFraction2FeedbackVoltLut = [0 0.00882057;1 7.92411];
feedbackOffset_V = 0;

% Advanced Settings. Note: these settings are unused for vDAQ based systems
modifiedLineClockIn = '';     % Terminal to which external beam trigger is connected. Leave empty for automatic routing via PXI/RTSI bus
frameClockIn = '';     % Terminal to which external frame clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockIn = '';     % Terminal to which external reference clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockRate = 1e+07;     % if referenceClockIn is used, referenceClockRate defines the rate of the reference clock in Hz. Default: 10e6Hz

%% scanimage.components.scan2d.ResScan (ResScanner)
% DAQ settings
rioDeviceID = 'RIO0';     % FlexRIO Device ID as specified in MAX. If empty, defaults to 'RIO0'
digitalIODeviceName = 'PXI1Slot3';     % String: Device name of the DAQ board or FlexRIO FPGA that is used for digital inputs/outputs (triggers/clocks etc). If it is a DAQ device, it must be installed in the same PXI chassis as the FlexRIO Digitizer

channelsInvert = [true true];     % Logical: Specifies if the input signal is inverted (i.e., more negative for increased light signal)

externalSampleClock = false;     % Logical: use external sample clock connected to the CLK IN terminal of the FlexRIO digitizer module
externalSampleClockRate = 8e+07;     % [Hz]: nominal frequency of the external sample clock connected to the CLK IN terminal (e.g. 80e6); actual rate is measured on FPGA

enableRefClkOutput = false;     % Enables/disables the 10MHz reference clock output on PFI14 of the digitalIODevice

% Scanner settings
resonantScanner = 'Resonant Scanner';     % Name of the resonant scanner
xGalvo = '';     % Name of the x galvo scanner
yGalvo = 'y Galvo';     % Name of the y galvo scanner
beams = {'Resonant Laser'};     % beam device names
fastZs = {};     % fastZ device names
shutters = {'Main Shutter'};     % shutter device names

extendedRggFov = false;     % If true and x galvo is present, addressable FOV is combination of resonant FOV and x galvo FOV.
keepResonantScannerOn = false;     % Always keep resonant scanner on to avoid drift and settling time issues

% Advanced/Optional
PeriodClockDebounceTime = 1e-07;     % [s] time the period clock has to be stable before a change is registered
TriggerDebounceTime = 5e-07;     % [s] time acquisition, stop and next trigger to be stable before a change is registered
reverseLineRead = 0;     % flips the image in the resonant scan axis

% Aux Trigger Recording, Photon Counting, and I2C are mutually exclusive

% Aux Trigger Recording
auxTriggersEnable = true;
auxTriggersTimeDebounce = 1e-06;     % [s] time an aux trigger needs to be high for registering an edge (seconds)
auxTriggerLinesInvert = [false;false;false;false];     % [logical] 1x4 vector specifying polarity of aux trigger inputs

% Photon Counting
photonCountingEnable = false;
photonCountingDisableAveraging = [];     % disable averaging of samples into pixels; instead accumulate samples
photonCountingScaleByPowerOfTwo = 8;     % for use with photonCountingDisableAveraging == false; scale count by 2^n before averaging to avoid loss of precision by integer division
photonCountingDebounce = 2.5e-08;     % [s] time the TTL input needs to be stable high before a pulse is registered

% I2C
I2CEnable = false;
I2CAddress = 0;     % [byte] I2C address of the FPGA
I2CDebounce = 5e-07;     % [s] time the I2C signal has to be stable high before a change is registered
I2CStoreAsChar = false;     % if false, the I2C packet bytes are stored as a uint8 array. if true, the I2C packet bytes are stored as a string. Note: a Null byte in the packet terminates the string
I2CDisableAckOutput = false;     % the FPGA confirms each packet with an ACK bit by actively pulling down the SDA line. I2C_DISABLE_ACK_OUTPUT = true disables the FPGA output

% Laser Trigger
LaserTriggerPort = '';     % Port on FlexRIO AM digital breakout (DIO0.[0:3]) where laser trigger is connected.
LaserTriggerFilterTicks = 0;
LaserTriggerSampleMaskEnable = false;
LaserTriggerSampleWindow = [0 1];

% Calibration data
scannerToRefTransform = [1 0 0;0 1 0;0 0 1];

%% scanimage.components.scan2d.LinScan (LinScanner)
deviceNameAcq = 'RIO0';     % string identifying NI DAQ board for PMT channels input
deviceNameAux = 'PXI1Slot5';     % string identifying NI DAQ board for outputting clocks. leave empty if unused. Must be a X-series board

externalSampleClock = false;     % Logical: use external sample clock connected to the CLK IN terminal of the FlexRIO digitizer module
externalSampleClockRate = 8e+07;     % [Hz]: nominal frequency of the external sample clock connected to the CLK IN terminal (e.g. 80e6); actual rate is measured on FPGA

% Optional
channelsInvert = [true true false false];     % scalar or vector identifiying channels to invert. if scalar, the value is applied to all channels

xGalvo = 'Stim x Galvo';     % x Galvo device name
yGalvo = 'Stim y Galvo';     % y Galvo device name
fastZs = {};     % fastZ device names
beams = {'Stim Laser'};     % fastZ device names
shutters = {};     % shutter device names

referenceClockIn = '';     % one of {'',PFI14} to which 10MHz reference clock is connected on Aux board. Leave empty for automatic routing via PXI bus
enableRefClkOutput = false;     % Enables/disables the export of the 10MHz reference clock on PFI14

% Acquisition
channelIDs = [0 1 2 3];     % Array of numeric channel IDs for PMT inputs. Leave empty for default channels (AI0...AIN-1)

% Advanced/Optional:
stripingEnable = false;     % enables/disables striping display
stripingMaxRate = 10;     % [Hz] determines the maximum display update rate for striping
maxDisplayRate = 30;     % [Hz] limits the maximum display rate (affects frame batching)
internalRefClockSrc = '';     % Reference clock to use internally
internalRefClockRate = [];     % Rate of reference clock to use internally
secondaryFpgaFifo = false;     % specifies if the secondary fpga fifo should be used

% Laser Trigger
LaserTriggerPort = '';     % Port on FlexRIO AM digital breakout (DIO0.[0:3]) or digital IO DAQ (PFI[0:23]) where laser trigger is connected.
LaserTriggerFilterTicks = 0;
LaserTriggerSampleMaskEnable = false;
LaserTriggerSampleWindow = [0 1];

% Calibration data
scannerToRefTransform = [0.959354 0.00261363 1.0735;-0.005547 1.27164 -1.36799;0.000132121 -0.00115429 0.824363];

%% scanimage.components.scan2d.SlmScan (SlmScan)
slm = 'SLM';     % name of the slm in use

linearScannerName = 'LinScanner';     % Name of galvo-galvo-scanner (from first MDF section) to use in series with the SLM. Must be a linear scanner
deviceNameAcq = 'RIO0';     % String identifying NI DAQ board for PMT channels input

channelsInvert = [true true];     % Scalar or vector identifiying channels to invert. if scalar, the value is applied to all channels

shutters = {};     % shutter device names
beams = {'Stim Laser'};     % Numeric: ID of the beam DAQ to use with the linear scan system

focalLength = 2000;     % [mm] Focal length of the image forming lens of the SLM.
slmMediumRefractiveIdx = 1.0003;     % Refractive index of medium SLM works in. (typically air, 1.000293).
objectiveMediumRefractiveIdx = 1.333;     % Refractive index of medium objective works in. (typically water, 1.333).
zeroOrderBlockRadius = 0.1;     % [mm] Radius of area at center of SLM FOV that cannot be excited, usually due to presence of zero-order beam block


% Calibration data
scannerToRefTransform = [-0.347404 -1.39924 0.760546;1.94799 -0.465266 -0.367634;0 0 1];
lutCalibrationAI = '';     % Name of AI channel for measuring zero order spot for LUT calibration

%% dabs.thorlabs.MCM3000_Async (thorlabs MCM3001)
comPort = 'COM8';     % Serial port the stage is connected to (e.g. 'COM3')

%% dabs.generic.FastZPureAnalog (ReVibro DM)
AOControl = '/PXI1Slot4/AO1';     % control terminal  e.g. '/vDAQ0/AO0'
AIFeedback = '/PXI1Slot4/AI1';     % feedback terminal e.g. '/vDAQ0/AI0'
FrameClockIn = '';     % frame clock input terminal e.g. '/Dev1/PFI0'

parkPositionUm = 0;     % park position in micron
travelRangeUm = [-65 65];     % travel range in micron

voltsPerUm = -0.076923;     % volts per micron
voltsOffset = 5;     % volts that sets actuator to zero position

% Calibration Data
positionLUT = zeros(0,2);     % Position LUT
feedbackVoltLUT = zeros(0,2);     % [Nx2] lut translating feedback volts into position volts

