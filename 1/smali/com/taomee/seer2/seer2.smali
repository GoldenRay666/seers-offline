.class public Lcom/taomee/seer2/seer2;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "seer2.java"


# static fields
.field public static actInstance:Lcom/taomee/seer2/seer2; = null

.field public static final s_isDebug:Z = true

.field private static s_isPlayingVideo:Z


# instance fields
.field private m_glSurfaceView:Landroid/view/View;

.field private m_progressDialog:Landroid/app/ProgressDialog;

.field private m_skipButton:Landroid/widget/ImageButton;

.field private m_skipButtonLayout:Landroid/widget/FrameLayout;

.field private m_textEditView:Landroid/view/View;

.field private m_videoLayout:Landroid/widget/FrameLayout;

.field private m_videoView:Landroid/widget/VideoView;

.field private m_webLayout:Landroid/widget/LinearLayout;

.field private m_webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    sput-boolean v0, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    .line 191
    const-string v0, "game_logic"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/taomee/seer2/seer2;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/taomee/seer2/seer2;->m_webView:Landroid/webkit/WebView;

    return-void
.end method

.method static synthetic access$1(Lcom/taomee/seer2/seer2;)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_webLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$3(Lcom/taomee/seer2/seer2;Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/taomee/seer2/seer2;->m_progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$4(Lcom/taomee/seer2/seer2;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_progressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method public static removeProgressDialog()V
    .locals 2

    .prologue
    .line 346
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/seer2/seer2$9;

    invoke-direct {v1}, Lcom/taomee/seer2/seer2$9;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 355
    return-void
.end method

.method public static showProgressDialog()V
    .locals 2

    .prologue
    .line 335
    invoke-static {}, Lcom/taomee/seer2/seer2;->removeProgressDialog()V

    .line 336
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/seer2/seer2$8;

    invoke-direct {v1}, Lcom/taomee/seer2/seer2$8;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 343
    return-void
.end method


# virtual methods
.method public displayWebView(IIII)V
    .locals 6
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 199
    new-instance v0, Lcom/taomee/seer2/seer2$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/taomee/seer2/seer2$1;-><init>(Lcom/taomee/seer2/seer2;IIII)V

    invoke-virtual {p0, v0}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 229
    return-void
.end method

.method public hideVideoView()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 294
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 295
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 296
    iput-object v4, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    .line 297
    iput-object v4, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    .line 298
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 299
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 300
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_glSurfaceView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 301
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_textEditView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 302
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 80
    sput-object p0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    .line 82
    const/4 v1, 0x1

    sput v1, Lcom/tendcloud/tenddata/TalkingDataGA;->sPlatformType:I

    .line 84
    invoke-static {}, Lcom/taomee/util/ChannelManager;->initSDK()V

    .line 87
    new-instance v0, Lcom/taomee/android/crashlog/UploadCrashInfo;

    invoke-direct {v0}, Lcom/taomee/android/crashlog/UploadCrashInfo;-><init>()V

    .line 89
    .local v0, "uploadCrashInfo":Lcom/taomee/android/crashlog/UploadCrashInfo;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android_seer2_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/taomee/util/ChannelManager;->getChannelName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 88
    invoke-virtual {v0, p0, v1}, Lcom/taomee/android/crashlog/UploadCrashInfo;->upload(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    .line 15
    # Disabled VManager for Android 12+ compatibility
    nop

    nop

    nop

    nop

    .line 16
    nop

    nop

    nop

    nop

    return-void
.end method

.method public onCreateView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, -0x1

    .line 112
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 115
    .local v3, "framelayout_params":Landroid/view/ViewGroup$LayoutParams;
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 116
    .local v2, "framelayout":Landroid/widget/FrameLayout;
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 121
    const/4 v5, -0x2

    .line 119
    invoke-direct {v1, v7, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 122
    .local v1, "edittext_layout_params":Landroid/view/ViewGroup$LayoutParams;
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxEditText;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxEditText;-><init>(Landroid/content/Context;)V

    .line 123
    .local v0, "edittext":Lorg/cocos2dx/lib/Cocos2dxEditText;
    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxEditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    iput-object v0, p0, Lcom/taomee/seer2/seer2;->m_textEditView:Landroid/view/View;

    .line 127
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 130
    new-instance v4, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v4, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 133
    .local v4, "gLSurfaceView":Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 135
    new-instance v5, Lorg/cocos2dx/lib/Cocos2dxRenderer;

    invoke-direct {v5}, Lorg/cocos2dx/lib/Cocos2dxRenderer;-><init>()V

    invoke-virtual {v4, v5}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setCocos2dxRenderer(Lorg/cocos2dx/lib/Cocos2dxRenderer;)V

    .line 136
    invoke-virtual {v4, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setCocos2dxEditText(Lorg/cocos2dx/lib/Cocos2dxEditText;)V

    .line 137
    iput-object v4, p0, Lcom/taomee/seer2/seer2;->m_glSurfaceView:Landroid/view/View;

    .line 140
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/taomee/seer2/seer2;->m_webLayout:Landroid/widget/LinearLayout;

    .line 141
    iget-object v5, p0, Lcom/taomee/seer2/seer2;->m_webLayout:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 142
    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 141
    invoke-virtual {v2, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    .line 146
    iget-object v5, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 147
    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 146
    invoke-virtual {v2, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    iget-object v5, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v5, v8}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 151
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    .line 152
    iget-object v5, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 153
    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 152
    invoke-virtual {v2, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    iget-object v5, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v5, v8}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 157
    invoke-virtual {p0, v2}, Lcom/taomee/seer2/seer2;->setContentView(Landroid/view/View;)V

    .line 159
    sget-boolean v5, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    if-eqz v5, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/taomee/seer2/seer2;->playVideo()V

    .line 163
    :cond_0
    return-object v4
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 168
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onPause()V

    .line 173
    sget-boolean v0, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    .line 176
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 180
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onResume()V

    .line 185
    sget-boolean v0, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    .line 188
    :cond_0
    return-void
.end method

.method public onVideoFinished()V
    .locals 2

    .prologue
    .line 305
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    .line 306
    const/4 v0, 0x0

    sput-boolean v0, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    .line 307
    invoke-virtual {p0}, Lcom/taomee/seer2/seer2;->hideVideoView()V

    .line 308
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/seer2/seer2$6;

    invoke-direct {v1, p0}, Lcom/taomee/seer2/seer2$6;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 314
    return-void
.end method

.method public playVideo()V
    .locals 3

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/taomee/seer2/seer2;->showVideoView()V

    .line 319
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android.resource://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/taomee/seer2/seer2;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 320
    const/high16 v2, 0x7f060000

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 319
    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    .line 321
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    new-instance v1, Lcom/taomee/seer2/seer2$7;

    invoke-direct {v1, p0}, Lcom/taomee/seer2/seer2$7;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 328
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->seekTo(I)V

    .line 329
    iget-object v0, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    .line 330
    const/4 v0, 0x1

    sput-boolean v0, Lcom/taomee/seer2/seer2;->s_isPlayingVideo:Z

    .line 331
    return-void
.end method

.method public removeWebView()V
    .locals 1

    .prologue
    .line 244
    new-instance v0, Lcom/taomee/seer2/seer2$3;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/seer2$3;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {p0, v0}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 250
    return-void
.end method

.method public showExitDialog()V
    .locals 3

    .prologue
    .line 359
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u662f\u5426\u5b8c\u5168\u9000\u51fa\u672c\u5e94\u7528\uff1f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 360
    const-string v1, "\u53d6\u6d88"

    new-instance v2, Lcom/taomee/seer2/seer2$10;

    invoke-direct {v2, p0}, Lcom/taomee/seer2/seer2$10;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 367
    const-string v1, "\u786e\u8ba4"

    new-instance v2, Lcom/taomee/seer2/seer2$11;

    invoke-direct {v2, p0}, Lcom/taomee/seer2/seer2$11;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 375
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 376
    return-void
.end method

.method public showVideoView()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, -0x1

    const/4 v3, -0x2

    const/4 v4, 0x0

    .line 254
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_glSurfaceView:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 255
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_textEditView:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 256
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 257
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 260
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 263
    .local v0, "skipButtonParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v2, 0x55

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 264
    new-instance v2, Landroid/widget/ImageButton;

    invoke-direct {v2, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    .line 265
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    const v3, 0x7f020001

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 266
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    new-instance v3, Lcom/taomee/seer2/seer2$4;

    invoke-direct {v3, p0}, Lcom/taomee/seer2/seer2$4;-><init>(Lcom/taomee/seer2/seer2;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 273
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_skipButtonLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/taomee/seer2/seer2;->m_skipButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 276
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 279
    .local v1, "videoViewParams":Landroid/view/ViewGroup$LayoutParams;
    new-instance v2, Lcom/taomee/seer2/seer2$5;

    invoke-direct {v2, p0, p0}, Lcom/taomee/seer2/seer2$5;-><init>(Lcom/taomee/seer2/seer2;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    .line 287
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v2, v1}, Landroid/widget/VideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 288
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v2, v4}, Landroid/widget/VideoView;->setBackgroundColor(I)V

    .line 289
    iget-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/taomee/seer2/seer2;->m_videoView:Landroid/widget/VideoView;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 290
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/taomee/seer2/seer2;->m_videoLayout:Landroid/widget/FrameLayout;

    .line 291
    return-void
.end method

.method public updateURL(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 234
    new-instance v0, Lcom/taomee/seer2/seer2$2;

    invoke-direct {v0, p0, p1}, Lcom/taomee/seer2/seer2$2;-><init>(Lcom/taomee/seer2/seer2;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 239
    return-void
.end method
