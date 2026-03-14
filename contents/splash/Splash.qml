import QtQuick 2.15
import QtQuick.Window 2.2
import QtMultimedia 5.15

Rectangle {
    id: root
    height: Screen.height
    width: Screen.width


AnimatedImage {
        id: backgroundImage
        source: "images/steamgirl.gif"
        anchors.fill: parent
        paused: false
        smooth: true
        visible: true

        onFrameChanged: {
            if (currentFrame === frameCount - 1) {
                playing = false;
            }
        }
    }

    Audio {
        id: playSound
        source: "audio/steamgirl.mp3"
        volume: 0.5
        autoPlay: true
Component.onCompleted: {
        playSound.play()
    }
        onPlaybackStateChanged: {
            if (playbackState === MediaPlayer.PlayingState) {

                backgroundImage.playing = true;
            }
        }
    }
}
