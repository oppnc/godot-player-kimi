# AudioStreamWAV

> class AudioStreamWAV
> inherits AudioStreamWAV AudioStream

## Brief

Stores audio data loaded from WAV files.

## Description

AudioStreamWAV stores sound samples loaded from WAV files. To play the stored sound, use an `AudioStreamPlayer` (for non-positional audio) or `AudioStreamPlayer2D`/`AudioStreamPlayer3D` (for positional audio). The sound can be looped.
This class can also be used to store dynamically-generated PCM audio data. See also `AudioStreamGenerator` for procedural audio generation.

## Properties

> property data : PackedByteArray ; default=PackedByteArray() ; setter=set_data ; getter=get_data

Contains the audio data in bytes.
**Note:** If `format` is set to `FORMAT_8_BITS`, this property expects signed 8-bit PCM data. To convert from unsigned 8-bit PCM, subtract 128 from each byte.
**Note:** If `format` is set to `FORMAT_QOA`, this property expects data from a full QOA file.

> property format : Format ; default=0 ; setter=set_format ; getter=get_format

Audio format.

> property loop_begin : int ; default=0 ; setter=set_loop_begin ; getter=get_loop_begin

The loop start point (in number of samples, relative to the beginning of the stream).

> property loop_end : int ; default=0 ; setter=set_loop_end ; getter=get_loop_end

The loop end point (in number of samples, relative to the beginning of the stream).

> property loop_mode : LoopMode ; default=0 ; setter=set_loop_mode ; getter=get_loop_mode

The loop mode.

> property mix_rate : int ; default=44100 ; setter=set_mix_rate ; getter=get_mix_rate

The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
In games, common sample rates in use are `11025`, `16000`, `22050`, `32000`, `44100`, and `48000`.
According to the [Nyquist-Shannon sampling theorem](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem), there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as `32000` or `22050` may be usable with no loss in quality.

> property stereo : bool ; default=false ; setter=set_stereo ; getter=is_stereo

If `true`, audio is stereo.

> property tags : Dictionary ; default={} ; setter=set_tags ; getter=get_tags

Contains user-defined tags if found in the WAV data.
Commonly used tags include `title`, `artist`, `album`, `tracknumber`, and `date` (`date` does not have a standard date format).
**Note:** No tag is *guaranteed* to be present in every file, so make sure to account for the keys not always existing.
**Note:** Only WAV files using a `LIST` chunk with an identifier of `INFO` to encode the tags are currently supported.

## Methods

> method load_from_buffer(stream_data: PackedByteArray, options: Dictionary = {}) -> AudioStreamWAV ; qualifiers=static

Creates a new `AudioStreamWAV` instance from the given buffer. The buffer must contain WAV data.
The keys and values of `options` match the properties of `ResourceImporterWAV`. The usage of `options` is identical to `AudioStreamWAV.load_from_file`.

> method load_from_file(path: String, options: Dictionary = {}) -> AudioStreamWAV ; qualifiers=static

Creates a new `AudioStreamWAV` instance from the given file path. The file must be in WAV format.
The keys and values of `options` match the properties of `ResourceImporterWAV`.
**Example:** Load the first file dropped as a WAV and play it:

```text
                @onready var audio_player = $AudioStreamPlayer

                func _ready():
                    get_window().files_dropped.connect(_on_files_dropped)

                func _on_files_dropped(files):
                    if files[0].get_extension() == "wav":
                        audio_player.stream = AudioStreamWAV.load_from_file(files[0], {
                                "force/max_rate": true,
                                "force/max_rate_hz": 11025
                            })
                        audio_player.play()

```

> method save_to_wav(path: String) -> Error

Saves the AudioStreamWAV as a WAV file to `path`. Samples with IMA ADPCM or Quite OK Audio formats can't be saved.
**Note:** A `.wav` extension is automatically appended to `path` if it is missing.

## Enumerations

> enum Format

> enum_value Format.FORMAT_8_BITS = 0

8-bit PCM audio codec.

> enum_value Format.FORMAT_16_BITS = 1

16-bit PCM audio codec.

> enum_value Format.FORMAT_IMA_ADPCM = 2

Audio is lossily compressed as IMA ADPCM.

> enum_value Format.FORMAT_QOA = 3

Audio is lossily compressed as [Quite OK Audio](https://qoaformat.org/).

> enum LoopMode

> enum_value LoopMode.LOOP_DISABLED = 0

Audio does not loop.

> enum_value LoopMode.LOOP_FORWARD = 1

Audio loops the data between `loop_begin` and `loop_end`, playing forward only.

> enum_value LoopMode.LOOP_PINGPONG = 2

Audio loops the data between `loop_begin` and `loop_end`, playing back and forth.

> enum_value LoopMode.LOOP_BACKWARD = 3

Audio loops the data between `loop_begin` and `loop_end`, playing backward only.

## Tutorials
- [Audio streams]($DOCS_URL/tutorials/audio/audio_streams.html)
- [Runtime file loading and saving]($DOCS_URL/tutorials/io/runtime_file_loading_and_saving.html)
