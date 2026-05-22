.class final Le22/c55/s88/a;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/b/a;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Le22/c55/s88/e/j;


# direct methods
.method constructor <init>(Landroid/content/Context;Le22/c55/s88/e/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a;->a:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/a;->b:Le22/c55/s88/e/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Le22/c55/s88/b/f;I)V
    .locals 3

    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/a;->a:Landroid/content/Context;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/a;->b:Le22/c55/s88/e/j;

    invoke-static {v0, v1, v2}, Le22/c55/s88/Vaa;->a(Landroid/content/Context;Ljava/lang/String;Le22/c55/s88/e/j;)V

    :cond_0
    return-void
.end method

.method public a(Le22/c55/s88/b/f;J)V
    .locals 0

    return-void
.end method
