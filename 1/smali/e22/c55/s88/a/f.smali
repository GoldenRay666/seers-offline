.class public Le22/c55/s88/a/f;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/a/d;

.field private b:Le22/c55/s88/g/x;


# direct methods
.method public constructor <init>(Le22/c55/s88/a/d;Le22/c55/s88/g/x;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a/f;->a:Le22/c55/s88/a/d;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Le22/c55/s88/a/f;->b:Le22/c55/s88/g/x;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    sget-object v0, Le22/c55/s88/f/e;->bp:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iget-object v2, p0, Le22/c55/s88/a/f;->a:Le22/c55/s88/a/d;

    invoke-static {v2}, Le22/c55/s88/a/d;->c(Le22/c55/s88/a/d;)Landroid/widget/ListView;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Le22/c55/s88/g/x;

    sget-object v2, Le22/c55/s88/f/e;->bq:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Le22/c55/s88/a/f;->a:Le22/c55/s88/a/d;

    invoke-static {v1}, Le22/c55/s88/a/d;->a(Le22/c55/s88/a/d;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Le22/c55/s88/f/i;->c(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Le22/c55/s88/g/x;->a(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method
