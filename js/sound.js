
// for legacy browsers
const AudioContext = window.AudioContext || window.webkitAudioContext;

var global_audio_ctx = null;

function tone(freq, time_ms, volume_percentage) {
    if (global_audio_ctx === null) {
        try {
            global_audio_ctx = new AudioContext();
        } catch (e) {
            console.log("error: Web Audio API is not supported in this browser, error=" + e);
            return;
        }
    }

    //freq = pitchToFreq(pitch)
    //console.log("tone pitch=" + pitch + " (" + freq + " Hz) ms=" + time_ms + " v=" + volume_percentage + "%");
    if (global_audio_ctx.state == "suspended") {
        global_audio_ctx.resume();
        if (global_audio_ctx.state == "suspended") {
            //console.log("cannot play tone, user has not interacted with the game yet");
            return;
        }
    }

    // TODO: it might be more efficient to reuse oscillators
    const osc_gain = global_audio_ctx.createGain();
    osc_gain.connect(global_audio_ctx.destination);
    osc_gain.gain.setValueAtTime(volume_percentage / 100, global_audio_ctx.currentTime);
    const osc = global_audio_ctx.createOscillator();
    osc.type = 'square';
    osc.frequency.setValueAtTime(freq, global_audio_ctx.currentTime);
    osc.connect(osc_gain);
    osc.start();
    setTimeout(function stopOsc() {
        osc.stop();
    }, time_ms);
}
