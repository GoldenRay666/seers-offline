.class Le22/c55/s88/e/d;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/b/a;


# instance fields
.field final synthetic a:Le22/c55/s88/e/j;

.field final synthetic b:Le22/c55/s88/e/c;


# direct methods
.method constructor <init>(Le22/c55/s88/e/c;Le22/c55/s88/e/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iput-object p2, p0, Le22/c55/s88/e/d;->a:Le22/c55/s88/e/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Le22/c55/s88/b/f;I)V
    .locals 3

    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    const/4 v0, 0x5

    if-ne p2, v0, :cond_1

    :cond_0
    iget-object v0, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    new-instance v1, Le22/c55/s88/e/e;

    invoke-direct {v1, p0}, Le22/c55/s88/e/e;-><init>(Le22/c55/s88/e/d;)V

    invoke-virtual {v0, v1}, Le22/c55/s88/e/c;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le22/c55/s88/e/d;->a:Le22/c55/s88/e/j;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iget-object v0, v0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v0}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e/d;->a:Le22/c55/s88/e/j;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iget-object v1, v1, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v1}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iget-object v2, v2, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v2}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iget-object v1, v1, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v1}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-static {}, Le22/c55/s88/Vrr;->a()V

    :cond_1
    return-void
.end method

.method public a(Le22/c55/s88/b/f;J)V
    .locals 0

    return-void
.end method
