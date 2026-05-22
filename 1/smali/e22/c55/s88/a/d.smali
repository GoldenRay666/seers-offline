.class public Le22/c55/s88/a/d;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/util/List;

.field private c:Ljava/util/ArrayList;

.field private d:Le22/c55/s88/e/a;

.field private e:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/ListView;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le22/c55/s88/a/d;->c:Ljava/util/ArrayList;

    iput-object p1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    iput-object p3, p0, Le22/c55/s88/a/d;->e:Landroid/widget/ListView;

    return-void
.end method

.method static synthetic a(Le22/c55/s88/a/d;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Le22/c55/s88/a/d;Le22/c55/s88/e/a;)Le22/c55/s88/e/a;
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a/d;->d:Le22/c55/s88/e/a;

    return-object p1
.end method

.method private a(Le22/c55/s88/e/j;Landroid/os/Handler;)V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le22/c55/s88/a/e;

    invoke-direct {v1, p0, p1, p2}, Le22/c55/s88/a/e;-><init>(Le22/c55/s88/a/d;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic b(Le22/c55/s88/a/d;)Le22/c55/s88/e/a;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/d;->d:Le22/c55/s88/e/a;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/a/d;)Landroid/widget/ListView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/d;->e:Landroid/widget/ListView;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-virtual {p0}, Le22/c55/s88/a/d;->notifyDataSetChanged()V

    return-void
.end method

.method public a(Ljava/lang/String;)Z
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Le22/c55/s88/a/d;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    iget-object v2, p0, Le22/c55/s88/a/d;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Le22/c55/s88/a/d;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8

    const/4 v3, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    if-nez p2, :cond_2

    new-instance p2, Le22/c55/s88/g/x;

    iget-object v0, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    invoke-direct {p2, v0}, Le22/c55/s88/g/x;-><init>(Landroid/content/Context;)V

    :goto_0
    iget-object v0, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget v1, v0, Le22/c55/s88/e/j;->h:I

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->b(I)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Le22/c55/s88/g/x;->setTag(Ljava/lang/Object;)V

    new-instance v2, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2}, Le22/c55/s88/g/x;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    iget-object v4, v0, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Le22/c55/s88/f/e;->br:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Le22/c55/s88/f/e;->h:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "/"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Le22/c55/s88/f/i;->c(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->a(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_1
    iget-object v1, v0, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->a(Ljava/lang/String;)V

    iget-object v1, v0, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->b(Ljava/lang/String;)V

    iget-object v1, v0, Le22/c55/s88/e/j;->p:Ljava/lang/String;

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->c(Ljava/lang/String;)V

    iget v1, v0, Le22/c55/s88/e/j;->o:I

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->a(I)V

    invoke-virtual {p2, v6}, Le22/c55/s88/g/x;->a(Z)V

    invoke-virtual {p2, p0, p1}, Le22/c55/s88/g/x;->a(Landroid/view/View$OnClickListener;I)V

    iget-boolean v0, v0, Le22/c55/s88/e/j;->j:Z

    if-eqz v0, :cond_1

    invoke-virtual {p2, v7}, Le22/c55/s88/g/x;->a(Z)V

    :cond_1
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v1, v7, [I

    const v2, 0x10100a7

    aput v2, v1, v6

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const v3, -0x1f1b19

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v1, v7, [I

    const v2, 0x101009e

    aput v2, v1, v6

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const v3, -0xa0a0b

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, v0}, Le22/c55/s88/g/x;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object p2

    :cond_2
    check-cast p2, Le22/c55/s88/g/x;

    goto/16 :goto_0

    :cond_3
    iget-object v1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    const/16 v2, 0x10

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p2, v1}, Le22/c55/s88/g/x;->a(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {p0, v1}, Le22/c55/s88/a/d;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le22/c55/s88/a/d;->c:Ljava/util/ArrayList;

    iget-object v2, v0, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Le22/c55/s88/a/f;

    invoke-direct {v1, p0, p2}, Le22/c55/s88/a/f;-><init>(Le22/c55/s88/a/d;Le22/c55/s88/g/x;)V

    invoke-direct {p0, v0, v1}, Le22/c55/s88/a/d;->a(Le22/c55/s88/e/j;Landroid/os/Handler;)V

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->h:I

    const/4 v2, 0x2

    invoke-static {v1, v0, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;II)Z

    iget-object v1, p0, Le22/c55/s88/a/d;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/a/d;->b:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->e(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    :cond_0
    return-void
.end method
