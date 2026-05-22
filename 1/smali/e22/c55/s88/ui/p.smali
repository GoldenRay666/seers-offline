.class Le22/c55/s88/ui/p;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Le22/c55/s88/e/j;

.field final synthetic b:Le22/c55/s88/ui/n;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/n;[Le22/c55/s88/e/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    iput-object p2, p0, Le22/c55/s88/ui/p;->a:[Le22/c55/s88/e/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/ui/p;->a:[Le22/c55/s88/e/j;

    array-length v0, v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v0}, Le22/c55/s88/ui/n;->b(Le22/c55/s88/ui/n;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v0}, Le22/c55/s88/ui/n;->a(Le22/c55/s88/ui/n;)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Le22/c55/s88/ui/p;->a:[Le22/c55/s88/e/j;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v2, :cond_2

    aget-object v3, v1, v0

    iget-object v4, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    iget-object v5, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v5}, Le22/c55/s88/ui/n;->c(Le22/c55/s88/ui/n;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, v3}, Le22/c55/s88/ui/n;->a(Le22/c55/s88/ui/n;Ljava/util/List;Le22/c55/s88/e/j;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v4}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v4

    invoke-static {v4}, Le22/c55/s88/e/b;->a(Landroid/content/Context;)Le22/c55/s88/e/b;

    move-result-object v4

    invoke-virtual {v4}, Le22/c55/s88/e/b;->b()I

    move-result v4

    iput v4, v3, Le22/c55/s88/e/j;->U:I

    iget-object v4, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v4}, Le22/c55/s88/ui/n;->c(Le22/c55/s88/ui/n;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    iget-object v1, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v1}, Le22/c55/s88/ui/n;->c(Le22/c55/s88/ui/n;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/ui/n;->a(Le22/c55/s88/ui/n;Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v0}, Le22/c55/s88/ui/n;->e(Le22/c55/s88/ui/n;)Le22/c55/s88/g/p;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    iget-object v1, v1, Le22/c55/s88/ui/n;->a:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Le22/c55/s88/g/p;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    iget-object v1, p0, Le22/c55/s88/ui/p;->b:Le22/c55/s88/ui/n;

    invoke-static {v1}, Le22/c55/s88/ui/n;->b(Le22/c55/s88/ui/n;)I

    move-result v1

    iget-object v2, p0, Le22/c55/s88/ui/p;->a:[Le22/c55/s88/e/j;

    array-length v2, v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Le22/c55/s88/ui/n;->a(Le22/c55/s88/ui/n;I)I

    goto :goto_0
.end method
