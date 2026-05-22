.class Lcom/taomee/seer2/seer2$6;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->onVideoFinished()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/seer2/seer2;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$6;->this$0:Lcom/taomee/seer2/seer2;

    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 311
    invoke-static {}, Lcom/taomee/util/VideoUtil;->nativeVideoEnded()V

    .line 312
    return-void
.end method
