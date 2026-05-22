.class Le22/c55/s88/g/ae;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/g/ac;


# direct methods
.method constructor <init>(Le22/c55/s88/g/ac;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    const/4 v3, -0x1

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->bp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    sget-object v2, Le22/c55/s88/f/e;->bq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    invoke-static {v2}, Le22/c55/s88/g/ac;->b(Le22/c55/s88/g/ac;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Le22/c55/s88/f/i;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    iget-object v0, v0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    if-eqz v0, :cond_0

    if-ne v1, v3, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    iget-object v0, v0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0, v2}, Le22/c55/s88/g/l;->a(Landroid/graphics/Bitmap;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-le v1, v3, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    invoke-static {v0}, Le22/c55/s88/g/ac;->c(Le22/c55/s88/g/ac;)I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ae;->a:Le22/c55/s88/g/ac;

    iget-object v0, v0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0, v2, v1}, Le22/c55/s88/g/l;->a(Landroid/graphics/Bitmap;I)V

    goto :goto_0
.end method
