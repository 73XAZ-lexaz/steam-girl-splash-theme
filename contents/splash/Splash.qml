import QtQuick
import QtQuick.Window
import QtMultimedia

Rectangle {
    id: root
    height: Screen.height
    width: Screen.width
    color:"black"

    property int stage

    // This images loads the first frame of the video, so that we don't have a blank screen while the video is loading. It will be hidden once the video starts playing.
    Image {
        id: backgroundImage
        source: "images/start.png"
        anchors.fill: parent
        // This prevents the 16:10 picture from being stretched to fit the 16:9 screen, and instead crops it to fill the screen while maintaining its aspect ratio.
        fillMode: Image.PreserveAspectCrop
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }
    
    // This image is used to cover the video output once the video ends, so that we don't have a blank screen after the video finishes playing. It will be hidden while the video is playing.
    Image {
        id: endImage
        source: "images/end.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    MediaPlayer {
        id: player
        source: "video/steamgirl.mp4"

        videoOutput: videoOutput
        audioOutput: AudioOutput {
            volume: 1
        }

        Component.onCompleted: {
            player.play()
        }
        
        // When the video is done, show the end image
        onMediaStatusChanged: {
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                endImage.visible = true
            }
        }
    }

}
