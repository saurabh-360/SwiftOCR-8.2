# SwiftOCR-8.2
The project helps to get started with swiftOCR in xcode 8.2, swift 3 from here https://github.com/garnele007/SwiftOCR
## Steps to start

1. Make a new project in Xcode 8.2
2. Copy the frameworks folder from this repository, or from the original repo you find here https://github.com/garnele007/SwiftOCR.

<img width="1151" alt="Framework" src="https://cloud.githubusercontent.com/assets/19552394/21780007/fafb0886-d6cf-11e6-84b0-064e768564bd.png">

3. Paste it in your projct folder(right where you find the .xcodeproj file).


4. Go inside the frameworks folder, you will find three files

```
1. SwiftOCR.xcodeproj 
2. SwiftOCR(folder)
3. SwiftOCRTests(folder)
```
 
## Building the project with SwiftOCR
1. Drag and drop the **SwiftOCR.xcodeproj** file into your project inside the project (Make sure you do not create the workspace, this happens if you drop the file outside the project)

![pasteswiftocr](https://cloud.githubusercontent.com/assets/19552394/21780427/8ba59904-d6d1-11e6-86e0-13d012c49963.png)

2. Now go to **frameworks->SwiftOCR->GPUImage-master->framework**, you will find **GPUImage.xcodeproj** there.
3. Drag and drop this file too into the project.
![gpuimagepaste](https://cloud.githubusercontent.com/assets/19552394/21780436/910b43b2-d6d1-11e6-9719-cf34ffb9ed5a.png)


## The tricky part, Adding frameworks
1. Go to **targets->General** scroll down to Embedded Binaries
2. Click +Add
3. Type **GPUImage.framework**, select the one that is outside the scope of you project (having iOS)

![selectgpuimage](https://cloud.githubusercontent.com/assets/19552394/21780444/9934fe48-d6d1-11e6-8136-2ec68ac732b0.png)

4. Click +Add again, and type **Swiftocr.framework**, and select again the one with iOS.

![selectswiftocr](https://cloud.githubusercontent.com/assets/19552394/21780454/a0844d7a-d6d1-11e6-91a7-f9d904b99a59.png)

5. **import SwiftOCR** in before using it, and use it on and image like this (i Have used it on the image imageTest)
```Swift
 self.ocrInstance.recognize(UIImage.init(named: "imageTest")!) { [weak self] recognizedString in
            DispatchQueue.main.async {
                print(recognizedString)
                print(self?.ocrInstance.currentOCRRecognizedBlobs ?? "Recoginzed Blob is empty")
            }
        }
```
refer
https://github.com/garnele007/SwiftOCR for more options.
