.class public Lorg/cocos2dx/lib/Cocos2dxMusic;
.super Ljava/lang/Object;
.source "Cocos2dxMusic.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

.field private final mContext:Landroid/content/Context;

.field private mCurrentPath:Ljava/lang/String;

.field private mLeftVolume:F

.field private mPaused:Z

.field private mRightVolume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/cocos2dx/lib/Cocos2dxMusic;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxMusic;->TAG:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "pContext"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mContext:Landroid/content/Context;

    .line 56
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxMusic;->initData()V

    .line 57
    return-void
.end method

.method private createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;
    .locals 8
    .param p1, "pPath"    # Ljava/lang/String;

    .prologue
    .line 226
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 229
    .local v0, "mediaPlayer":Landroid/media/MediaPlayer;
    :try_start_0
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 236
    :goto_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 238
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mLeftVolume:F

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 244
    :goto_1
    return-object v0

    .line 232
    :cond_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 233
    .local v6, "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 239
    .end local v6    # "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v7

    .line 240
    .local v7, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 241
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxMusic;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private initData()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/high16 v0, 0x3f000000    # 0.5f

    .line 211
    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mLeftVolume:F

    .line 212
    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mRightVolume:F

    .line 213
    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z

    .line 215
    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    .line 216
    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 184
    :cond_0
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxMusic;->initData()V

    .line 185
    return-void
.end method

.method public getBackgroundVolume()F
    .locals 2

    .prologue
    .line 188
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 189
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mLeftVolume:F

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 191
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isBackgroundMusicPlaying()Z
    .locals 2

    .prologue
    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "ret":Z
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 171
    const/4 v0, 0x0

    .line 176
    :goto_0
    return v0

    .line 173
    :cond_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 140
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z

    .line 142
    :cond_0
    return-void
.end method

.method public playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "pPath"    # Ljava/lang/String;
    .param p2, "isLoop"    # Z

    .prologue
    .line 88
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 90
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxMusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 91
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    .line 107
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_3

    .line 108
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxMusic;->TAG:Ljava/lang/String;

    const-string v2, "playBackgroundMusic: background media player is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    :goto_1
    return-void

    .line 93
    :cond_1
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 97
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_2

    .line 98
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 100
    :cond_2
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxMusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 103
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 111
    :cond_3
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 113
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 116
    :try_start_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 117
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 118
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 120
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxMusic;->TAG:Ljava/lang/String;

    const-string v2, "playBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public preloadBackgroundMusic(Ljava/lang/String;)V
    .locals 1
    .param p1, "pPath"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 76
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 77
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 80
    :cond_1
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxMusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 83
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mCurrentPath:Ljava/lang/String;

    .line 85
    :cond_2
    return-void
.end method

.method public resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 147
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z

    .line 149
    :cond_0
    return-void
.end method

.method public rewindBackgroundMusic()V
    .locals 3

    .prologue
    .line 152
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 153
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 156
    :try_start_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 157
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 158
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 160
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxMusic;->TAG:Ljava/lang/String;

    const-string v2, "rewindBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setBackgroundVolume(F)V
    .locals 3
    .param p1, "pVolume"    # F

    .prologue
    .line 196
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 197
    const/4 p1, 0x0

    .line 200
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    .line 201
    const/high16 p1, 0x3f800000    # 1.0f

    .line 204
    :cond_1
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mRightVolume:F

    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mLeftVolume:F

    .line 205
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 206
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mLeftVolume:F

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 208
    :cond_2
    return-void
.end method

.method public stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 133
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxMusic;->mPaused:Z

    .line 135
    :cond_0
    return-void
.end method
