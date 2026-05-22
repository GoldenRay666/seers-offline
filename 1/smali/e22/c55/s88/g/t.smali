.class Le22/c55/s88/g/t;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Le22/c55/s88/e/j;

.field final synthetic b:Le22/c55/s88/g/s;


# direct methods
.method constructor <init>(Le22/c55/s88/g/s;[Le22/c55/s88/e/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    iput-object p2, p0, Le22/c55/s88/g/t;->a:[Le22/c55/s88/e/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;)I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v1}, Le22/c55/s88/g/s;->b(Le22/c55/s88/g/s;)Le22/c55/s88/g/y;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/Vaa;->a(Landroid/view/View;)V

    :goto_0
    iget-object v0, p0, Le22/c55/s88/g/t;->a:[Le22/c55/s88/e/j;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/t;->a:[Le22/c55/s88/e/j;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/t;->a:[Le22/c55/s88/e/j;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget v1, v1, Le22/c55/s88/e/j;->N:I

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;I)V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    iget-object v1, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v1}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Le22/c55/s88/f/a;->v(Landroid/content/Context;)I

    move-result v1

    invoke-static {v0, v1}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;I)I

    return-void

    :cond_1
    iget-object v0, p0, Le22/c55/s88/g/t;->b:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->b(Le22/c55/s88/g/s;)Le22/c55/s88/g/y;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/g/y;->a()V

    goto :goto_0
.end method
