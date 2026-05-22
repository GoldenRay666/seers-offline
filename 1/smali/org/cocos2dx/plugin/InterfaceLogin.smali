.class public interface abstract Lorg/cocos2dx/plugin/InterfaceLogin;
.super Ljava/lang/Object;
.source "InterfaceLogin.java"


# static fields
.field public static final PluginType:I = 0x1


# virtual methods
.method public abstract configDeveloperInfo(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract doBBS()V
.end method

.method public abstract doLogin()V
.end method

.method public abstract doLogout()V
.end method

.method public abstract doSdkAntiAddictionQuery(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract doSdkExit()V
.end method

.method public abstract doSdkRealNameRegister(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract getNickName()Ljava/lang/String;
.end method

.method public abstract getPluginVersion()Ljava/lang/String;
.end method

.method public abstract getSDKVersion()Ljava/lang/String;
.end method

.method public abstract getSession()Ljava/lang/String;
.end method

.method public abstract getUserId()Ljava/lang/String;
.end method

.method public abstract setDebugMode(Z)V
.end method
