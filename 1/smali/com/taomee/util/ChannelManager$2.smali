.class Lcom/taomee/util/ChannelManager$2;
.super Ljava/lang/Object;
.source "ChannelManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/util/ChannelManager;->logout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 80
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-static {}, Lcom/taomee/util/ChannelManager;->access$3()V

    .line 87
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    invoke-static {}, Lcom/taomee/util/ChannelManager;->access$4()V

    goto :goto_0
.end method
