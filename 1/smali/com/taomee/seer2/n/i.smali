.class Lcom/taomee/seer2/n/i;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/g;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/g;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    const/4 v3, -0x1

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/n/d/b;->aE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aC:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    invoke-static {v2}, Lcom/taomee/seer2/n/g;->b(Lcom/taomee/seer2/n/g;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/taomee/seer2/n/d/g;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    iget-object v2, v2, Lcom/taomee/seer2/n/g;->a:Lcom/taomee/seer2/n/l;

    if-eqz v2, :cond_0

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    iget-object v1, v1, Lcom/taomee/seer2/n/g;->a:Lcom/taomee/seer2/n/l;

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/n/l;->a(Landroid/graphics/Bitmap;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-le v1, v3, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    invoke-static {v2}, Lcom/taomee/seer2/n/g;->c(Lcom/taomee/seer2/n/g;)I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/n/i;->a:Lcom/taomee/seer2/n/g;

    iget-object v2, v2, Lcom/taomee/seer2/n/g;->a:Lcom/taomee/seer2/n/l;

    invoke-virtual {v2, v0, v1}, Lcom/taomee/seer2/n/l;->a(Landroid/graphics/Bitmap;I)V

    goto :goto_0
.end method
