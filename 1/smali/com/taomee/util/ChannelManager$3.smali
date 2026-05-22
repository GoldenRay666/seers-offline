.class Lcom/taomee/util/ChannelManager$3;
.super Ljava/lang/Object;
.source "ChannelManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/util/ChannelManager;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$confirmPwd:Ljava/lang/String;

.field private final synthetic val$pwd:Ljava/lang/String;

.field private final synthetic val$userName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/util/ChannelManager$3;->val$userName:Ljava/lang/String;

    iput-object p2, p0, Lcom/taomee/util/ChannelManager$3;->val$pwd:Ljava/lang/String;

    iput-object p3, p0, Lcom/taomee/util/ChannelManager$3;->val$confirmPwd:Ljava/lang/String;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 96
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 98
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/taomee/util/ChannelManager$3;->val$userName:Ljava/lang/String;

    iget-object v1, p0, Lcom/taomee/util/ChannelManager$3;->val$pwd:Ljava/lang/String;

    iget-object v2, p0, Lcom/taomee/util/ChannelManager$3;->val$confirmPwd:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/taomee/util/ChannelManager;->access$5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    :cond_0
    return-void
.end method
