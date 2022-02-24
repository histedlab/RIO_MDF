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
motorXYZ = {'Sutter' 'Sutter' 'Sutter'};     % Defines the motor for ScanImage axes X Y Z.
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
amplitudeToLinePhaseMap = [2.5 -5.175e-06;3 -5.175e-06;3.75 -5.1375e-06;5 -4.575e-06;5.17241 -5.1375e-06;5.35714 -5.1375e-06;5.55556 -5.1375e-06;5.76923 -5.1375e-06;6 -5.075e-06;6.25 -5.1375e-06;6.52174 -4.9125e-06;6.81818 -4.9125e-06;7.14286 -4.9125e-06;7.5 -5.0125e-06;15 -5e-06];     % translates an amplitude (degrees) to a line phase (seconds)
amplitudeToFrequencyMap = [3 7924.34;3.75 7923.11;5 7926.68;6 7928.11;7.5 7932.86;10 7927.5;15 7930.5];     % translates an amplitude (degrees) to a resonant frequency (Hz)
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
powerFraction2ModulationVoltLut = [0 0;0.00274575 0.0151515;0.00607974 0.030303;0.0099418 0.0454545;0.0143241 0.0606061;0.019148 0.0757576;0.0244145 0.0909091;0.0300193 0.106061;0.0359945 0.121212;0.0424901 0.136364;0.0493105 0.151515;0.0564218 0.166667;0.0640037 0.181818;0.071722 0.19697;0.0801314 0.212121;0.0885719 0.227273;0.0975693 0.242424;0.106898 0.257576;0.116239 0.272727;0.126218 0.287879;0.135657 0.30303;0.146112 0.318182;0.157235 0.333333;0.168277 0.348485;0.179716 0.363636;0.191516 0.378788;0.203244 0.393939;0.215971 0.409091;0.228289 0.424242;0.240546 0.439394;0.253695 0.454545;0.266553 0.469697;0.280378 0.484848;0.294237 0.5;0.307877 0.515152;0.322521 0.530303;0.336451 0.545455;0.350805 0.560606;0.365996 0.575758;0.37975 0.590909;0.394858 0.606061;0.409953 0.621212;0.425376 0.636364;0.440797 0.651515;0.455625 0.666667;0.471137 0.681818;0.48628 0.69697;0.500849 0.712121;0.517357 0.727273;0.532567 0.742424;0.546765 0.757576;0.562699 0.772727;0.577687 0.787879;0.595216 0.80303;0.610081 0.818182;0.624795 0.833333;0.638456 0.848485;0.65464 0.863636;0.669638 0.878788;0.684938 0.893939;0.699117 0.909091;0.712838 0.924242;0.728315 0.939394;0.741051 0.954545;0.755521 0.969697;0.770563 0.984848;0.783096 1;0.79653 1.01515;0.809375 1.0303;0.822667 1.04545;0.833692 1.06061;0.844879 1.07576;0.854615 1.09091;0.862429 1.10606;0.871877 1.12121;0.880814 1.13636;0.890936 1.15152;0.898333 1.16667;0.904683 1.18182;0.910323 1.19697;0.914052 1.21212;0.921898 1.22727;0.928648 1.24242;0.933939 1.25758;0.93959 1.27273;0.942192 1.28788;0.94444 1.30303;0.948238 1.31818;0.94985 1.33333;0.953801 1.34848;0.960669 1.36364;0.965867 1.37879;0.97147 1.39394;0.974404 1.40909;0.978975 1.42424;0.984381 1.43939;0.989318 1.45455;0.994128 1.4697;0.996967 1.48485;1 1.5];
powerFraction2PowerWattLut = zeros(0,2);
powerFraction2FeedbackVoltLut = [0 0.00525995;1 0.599483];
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
powerFraction2ModulationVoltLut = [0 0.40404;6.4665e-07 0.454545;1.14696e-06 0.505051;1.86714e-06 0.555556;3.78835e-06 0.606061;6.68782e-06 0.656566;1.42854e-05 0.707071;2.56425e-05 0.757576;4.68681e-05 0.808081;8.51574e-05 0.858586;0.000157421 0.909091;0.000284717 0.959596;0.000499538 1.0101;0.000847091 1.06061;0.0013792 1.11111;0.00216324 1.16162;0.00324633 1.21212;0.0047078 1.26263;0.00659532 1.31313;0.00896551 1.36364;0.0118624 1.41414;0.0153572 1.46465;0.0194455 1.51515;0.0242162 1.56566;0.029603 1.61616;0.0356617 1.66667;0.042448 1.71717;0.0499811 1.76768;0.058283 1.81818;0.0673112 1.86869;0.0770996 1.91919;0.0876521 1.9697;0.0990337 2.0202;0.111046 2.07071;0.123937 2.12121;0.137572 2.17172;0.151979 2.22222;0.167035 2.27273;0.182993 2.32323;0.199555 2.37374;0.216493 2.42424;0.234428 2.47475;0.2528 2.52525;0.271804 2.57576;0.291082 2.62626;0.311081 2.67677;0.331781 2.72727;0.352624 2.77778;0.374088 2.82828;0.396064 2.87879;0.418306 2.92929;0.440498 2.9798;0.463164 3.0303;0.485868 3.08081;0.507982 3.13131;0.530709 3.18182;0.552999 3.23232;0.575343 3.28283;0.597385 3.33333;0.619575 3.38384;0.641171 3.43434;0.663337 3.48485;0.68382 3.53535;0.704781 3.58586;0.725941 3.63636;0.745286 3.68687;0.764785 3.73737;0.783263 3.78788;0.801258 3.83838;0.817898 3.88889;0.834274 3.93939;0.84962 3.9899;0.865402 4.0404;0.879421 4.09091;0.892262 4.14141;0.904653 4.19192;0.916531 4.24242;0.926288 4.29293;0.936271 4.34343;0.945675 4.39394;0.953546 4.44444;0.960952 4.49495;0.96765 4.54545;0.974048 4.59596;0.978973 4.64646;0.982756 4.69697;0.986587 4.74747;0.989497 4.79798;0.992482 4.84848;0.994497 4.89899;0.996751 4.94949;1 5];
powerFraction2PowerWattLut = zeros(0,2);
powerFraction2FeedbackVoltLut = [0 0.0103004;1 8.94612];
feedbackOffset_V = 0.00937256;

% Advanced Settings. Note: these settings are unused for vDAQ based systems
modifiedLineClockIn = '';     % Terminal to which external beam trigger is connected. Leave empty for automatic routing via PXI/RTSI bus
frameClockIn = '';     % Terminal to which external frame clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockIn = '';     % Terminal to which external reference clock is connected. Leave empty for automatic routing via PXI/RTSI bus
referenceClockRate = 1e+07;     % if referenceClockIn is used, referenceClockRate defines the rate of the reference clock in Hz. Default: 10e6Hz

%% dabs.sutter.MPC200_Async (Sutter)
comPort = 'COM5';     % Serial port the stage is connected to (e.g. 'COM3')

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
scannerToRefTransform = [0.96799 0.00303836 0.796792;-0.00219535 1.25754 -0.321662;0.000132121 -0.00115429 0.824363];

%% scanimage.components.scan2d.SlmScan (SlmScan)
slm = 'SLM';     % name of the slm in use

linearScannerName = 'LinScanner';     % Name of galvo-galvo-scanner (from first MDF section) to use in series with the SLM. Must be a linear scanner
deviceNameAcq = 'RIO0';     % String identifying NI DAQ board for PMT channels input

channelsInvert = [true true false false];     % Scalar or vector identifiying channels to invert. if scalar, the value is applied to all channels

shutters = {};     % shutter device names
beams = {'Stim Laser'};     % Numeric: ID of the beam DAQ to use with the linear scan system

focalLength = 25;     % [mm] Focal length of the image forming lens of the SLM.
slmMediumRefractiveIdx = 1.0003;     % Refractive index of medium SLM works in. (typically air, 1.000293).
objectiveMediumRefractiveIdx = 1.333;     % Refractive index of medium objective works in. (typically water, 1.333).
zeroOrderBlockRadius = 0.1;     % [mm] Radius of area at center of SLM FOV that cannot be excited, usually due to presence of zero-order beam block


% Calibration data
scannerToRefTransform = [-0.347404 -1.39924 0.760546;1.94799 -0.465266 -0.367634;0 0 1];
lutCalibrationAI = '';     % Name of AI channel for measuring zero order spot for LUT calibration

