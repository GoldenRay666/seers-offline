.class Lcom/taomee/util/ChannelManager$1;
.super Ljava/lang/Object;
.source "ChannelManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/util/ChannelManager;->login(Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$isRecord:Z

.field private final synthetic val$pwd:Ljava/lang/String;

.field private final synthetic val$userName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/util/ChannelManager$1;->val$userName:Ljava/lang/String;

    iput-object p2, p0, Lcom/taomee/util/ChannelManager$1;->val$pwd:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/taomee/util/ChannelManager$1;->val$isRecord:Z

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 65
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    invoke-static {}, Lcom/taomee/util/ChannelManager;->access$0()V

    .line 72
    :goto_0
    return-void

    .line 67
    :cond_0
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    invoke-static {}, Lcom/taomee/util/ChannelManager;->access$1()V

    goto :goto_0

    .line 70
    :cond_1
    iget-object v0, p0, Lcom/taomee/util/ChannelManager$1;->val$userName:Ljava/lang/String;

    iget-object v1, p0, Lcom/taomee/util/ChannelManager$1;->val$pwd:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/taomee/util/ChannelManager$1;->val$isRecord:Z

    invoke-static {v0, v1, v2}, Lcom/taomee/util/ChannelManager;->access$2(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method
