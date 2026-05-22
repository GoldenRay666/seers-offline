.class Lcom/taomee/seer2/seer2$5;
.super Landroid/widget/VideoView;
.source "seer2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->showVideoView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/seer2/seer2;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$5;->this$0:Lcom/taomee/seer2/seer2;

    .line 279
    invoke-direct {p0, p2}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v2, 0x0

    .line 282
    invoke-static {v2, p1}, Lcom/taomee/seer2/seer2$5;->getDefaultSize(II)I

    move-result v1

    .line 283
    .local v1, "width":I
    invoke-static {v2, p2}, Lcom/taomee/seer2/seer2$5;->getDefaultSize(II)I

    move-result v0

    .line 284
    .local v0, "height":I
    invoke-virtual {p0, v1, v0}, Lcom/taomee/seer2/seer2$5;->setMeasuredDimension(II)V

    .line 285
    return-void
.end method
